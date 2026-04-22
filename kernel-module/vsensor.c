#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/device.h>
#include <linux/cdev.h>
#include <linux/timer.h>
#include <linux/spinlock.h>
#include <linux/uaccess.h>
#include <linux/random.h>
#include <linux/ktime.h>

#include "vsensor.h" 

#define DEVICE_NAME "vsensor"
#define NUM_DEVICES 1
#define VSENSOR_BUFFER_SIZE 16
#define VSENSOR_DEFAULT_INTERVAL_MS 1000  // 1 second

static DEFINE_SPINLOCK(vsensor_lock);

static dev_t vsensor_dev_num;
static struct cdev vsensor_cdev;
static struct class *vsensor_class;

static struct vsensor_reading ring_buffer[VSENSOR_BUFFER_SIZE];
static int ring_head = 0;                                                   // next write position
static int ring_count = 0;                                                  // number of valid entries (0 to BUFFER_SIZE)

static struct timer_list vsensor_timer;
static u32 vsensor_interval_ms = VSENSOR_DEFAULT_INTERVAL_MS;

/* =========== Timer callback: generate a new reading =========== */
static void vsensor_timer_callback(struct timer_list *t)
{
    struct vsensor_reading r;
    u32 rand;
    unsigned long flags;

    /* Generate a pseudo-realistic temperature around 22°C ± 2°C */
    get_random_bytes(&rand, sizeof(rand));
    r.temperature_mC = 20000 + (rand % 5000);  /* 20.000 to 24.999 °C */

    /* Humidity around 55% ± 10% */
    get_random_bytes(&rand, sizeof(rand));
    r.humidity_mRH = 45000 + (rand % 20000);   /* 45.000 to 64.999 %RH */

    r.timestamp_ns = ktime_get_ns();

    /* Write to ring buffer under lock */
    spin_lock_irqsave(&vsensor_lock, flags);
    ring_buffer[ring_head] = r;
    ring_head = (ring_head + 1) % VSENSOR_BUFFER_SIZE;
    if (ring_count < VSENSOR_BUFFER_SIZE)
        ring_count++;
    spin_unlock_irqrestore(&vsensor_lock, flags);

    /* Rearm the timer */
    mod_timer(&vsensor_timer, jiffies + msecs_to_jiffies(vsensor_interval_ms));
}

/* =========== File Operations =========== */

// vsensor Open function
static int vsensor_open(struct inode *inode, struct file *file)
{
    pr_info("%s\n", __func__);
    return 0;
}

// vsensor Release function
static int vsensor_release(struct inode *inode, struct file *file)
{
    pr_info("%s\n", __func__);
    return 0;
}

// vsensor Read function
static ssize_t vsensor_read(struct file *file, char __user *buffer, size_t length, loff_t *offset)
{
    struct vsensor_reading latest;
    unsigned long flags;
    int last_index;

    /* If userspace calls read again after one full reading, return EOF */
    if (*offset > 0)
        return 0;

    /* The buffer must be at least sizeof(reading) bytes */
    if (length < sizeof(struct vsensor_reading))
        return -EINVAL;

    /* Grab the most recent reading under lock */
    spin_lock_irqsave(&vsensor_lock, flags);
    if (ring_count == 0) {
        spin_unlock_irqrestore(&vsensor_lock, flags);
        return 0;  /* No data yet */
    }

    /* Most recent reading is at (head - 1) mod SIZE */
    last_index = (ring_head - 1 + VSENSOR_BUFFER_SIZE) % VSENSOR_BUFFER_SIZE;
    latest = ring_buffer[last_index];
    spin_unlock_irqrestore(&vsensor_lock, flags);

    /* Copy the reading to userspace */
    if (copy_to_user(buffer, &latest, sizeof(latest)))
        return -EFAULT;

    *offset += sizeof(latest);
    return sizeof(latest);
}

/* =========== IOCTL Handler =========== */
static long vsensor_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
{
    u32 tmp;
    unsigned long flags;

    switch (cmd) {

    case VSENSOR_SET_INTERVAL:
        /* Copy the new interval value from userspace */
        if (copy_from_user(&tmp, (u32 __user *)arg, sizeof(tmp)))
            return -EFAULT;

        /* Sanity check: don't allow intervals less than 100ms or more than 10s */
        if (tmp < 100 || tmp > 10000)
            return -EINVAL;

        vsensor_interval_ms = tmp;
        /* The new interval takes effect on the next timer tick */
        pr_info("vsensor: interval set to %u ms\n", tmp);
        return 0;

    case VSENSOR_GET_INTERVAL:
        tmp = vsensor_interval_ms;
        if (copy_to_user((u32 __user *)arg, &tmp, sizeof(tmp)))
            return -EFAULT;
        return 0;

    case VSENSOR_GET_COUNT:
        spin_lock_irqsave(&vsensor_lock, flags);
        tmp = ring_count;
        spin_unlock_irqrestore(&vsensor_lock, flags);
        if (copy_to_user((u32 __user *)arg, &tmp, sizeof(tmp)))
            return -EFAULT;
        return 0;

    case VSENSOR_FLUSH:
        spin_lock_irqsave(&vsensor_lock, flags);
        ring_head = 0;
        ring_count = 0;
        spin_unlock_irqrestore(&vsensor_lock, flags);
        pr_info("vsensor: buffer flushed\n");
        return 0;

    default:
        return -ENOTTY;  /* standard return for "unknown ioctl command" */
    }
}

// Initialization of 'file_operations' structure
static struct file_operations vsensor_fops = {
    .owner      = THIS_MODULE,
    .open       = vsensor_open,
    .release    = vsensor_release,
    .read       = vsensor_read,
    .unlocked_ioctl = vsensor_ioctl,
    .llseek         = default_llseek
};

// vsensor init function
static int __init vsensor_init(void)
{
    int ret;
    
    // Dynamically allocate a major number
    ret = alloc_chrdev_region(&vsensor_dev_num, 0, NUM_DEVICES, DEVICE_NAME);
    if(ret<0)
    {
        pr_err("vsensor: failed to allocate major number\n");
        return ret;
    }
    pr_info("vsensor: registered with major %d, minor %d\n",
    MAJOR(vsensor_dev_num), MINOR(vsensor_dev_num));

    // Initialize and add cdev
    cdev_init(&vsensor_cdev, &vsensor_fops);
    vsensor_cdev.owner = THIS_MODULE;
    ret = cdev_add(&vsensor_cdev, vsensor_dev_num, NUM_DEVICES);
    if (ret < 0) {
        pr_err("vsensor: failed to add cdev\n");
        unregister_chrdev_region(vsensor_dev_num, NUM_DEVICES);
        return ret;
    }

    // Create device class and device node automatically 
    vsensor_class = class_create(DEVICE_NAME);
    if (IS_ERR(vsensor_class)) {
        pr_err("vsensor: failed to create class\n");
        cdev_del(&vsensor_cdev);
        unregister_chrdev_region(vsensor_dev_num, NUM_DEVICES);
        return PTR_ERR(vsensor_class);
    }

    device_create(vsensor_class, NULL, vsensor_dev_num, NULL, DEVICE_NAME);

    /* Initialize and start the timer */
    timer_setup(&vsensor_timer, vsensor_timer_callback, 0);
    mod_timer(&vsensor_timer, jiffies + msecs_to_jiffies(vsensor_interval_ms));

    printk("Virtual Sensor loaded Successfully\n");

    return 0;
}

// vsensor exit function
static void __exit vsensor_exit(void)
{
    /* Stop the timer FIRST so it can't fire during teardown */
    timer_delete_sync(&vsensor_timer);

    device_destroy(vsensor_class, vsensor_dev_num);
    class_destroy(vsensor_class);
    cdev_del(&vsensor_cdev);
    unregister_chrdev_region(vsensor_dev_num, NUM_DEVICES);

    printk("Virtual Sensor unloaded Successfully\n");
}

module_init(vsensor_init);
module_exit(vsensor_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("George Rafail Giosmas");
MODULE_DESCRIPTION("A Virtual Sensor driver");
