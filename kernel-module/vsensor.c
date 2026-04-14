#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/device.h>
#include <linux/cdev.h>

#define DEVICE_NAME "vsensor"
#define NUM_DEVICES 1

static dev_t vsensor_dev_num;
static struct cdev vsensor_cdev;
static struct class *vsensor_class;

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
    pr_info("%s %zu\n", __func__, length);
    return 0;
}

// vsensor Write function
static ssize_t vsensor_write(struct file *file, const char __user *buffer, size_t length, loff_t *offset)
{
    pr_info("%s %zu\n", __func__, length);
    return length;
}

// Initialization of 'file_operations' structure
static struct file_operations vsensor_fops = {
    .owner      = THIS_MODULE,
    .open       = vsensor_open,
    .release    = vsensor_release,
    .read       = vsensor_read,
    .write      = vsensor_write
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

    printk("Virtual Sensor loaded Successfully\n");

    return 0;
}

// vsensor exit function
static void __exit vsensor_exit(void)
{

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
