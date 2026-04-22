#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <signal.h>
#include <sys/ioctl.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>

/* 
 * We need the same struct and ioctl definitions as the kernel module.
 * In a real project you'd install vsensor.h to a shared location.
 * For now we redefine the essentials using userspace-safe types.
 */
#include <linux/ioctl.h>

struct vsensor_reading {
    int32_t  temperature_mC;
    int32_t  humidity_mRH;
    uint64_t timestamp_ns;
};

#define VSENSOR_IOC_MAGIC  'V'
#define VSENSOR_SET_INTERVAL  _IOW(VSENSOR_IOC_MAGIC, 1, uint32_t)
#define VSENSOR_GET_INTERVAL  _IOR(VSENSOR_IOC_MAGIC, 2, uint32_t)
#define VSENSOR_GET_COUNT     _IOR(VSENSOR_IOC_MAGIC, 3, uint32_t)
#define VSENSOR_FLUSH         _IO(VSENSOR_IOC_MAGIC, 4)

#define DEVICE_PATH "/dev/vsensor"

static volatile int running = 1;

static void signal_handler(int sig)
{
    (void)sig;
    running = 0;
}

static void print_usage(const char *prog)
{
    printf("Usage: %s [options]\n", prog);
    printf("  -i <ms>    Set sampling interval (100-10000 ms)\n");
    printf("  -n <count> Number of readings to take (0 = continuous)\n");
    printf("  -f         Flush buffer before starting\n");
    printf("  -s         Show status and exit\n");
    printf("  -h         Show this help\n");
}

int main(int argc, char *argv[])
{
    int fd;
    int opt;
    uint32_t interval = 0;      /* 0 means don't change */
    uint32_t max_readings = 0;  /* 0 means continuous */
    int flush = 0;
    int status_only = 0;
    uint32_t count = 0;

    /* Parse command line arguments */
    while ((opt = getopt(argc, argv, "i:n:fsh")) != -1) {
        switch (opt) {
        case 'i':
            interval = (uint32_t)atoi(optarg);
            break;
        case 'n':
            max_readings = (uint32_t)atoi(optarg);
            break;
        case 'f':
            flush = 1;
            break;
        case 's':
            status_only = 1;
            break;
        case 'h':
        default:
            print_usage(argv[0]);
            return (opt == 'h') ? 0 : 1;
        }
    }

    /* Set up signal handler for clean Ctrl+C */
    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);

    /* Open the device */
    fd = open(DEVICE_PATH, O_RDWR);
    if (fd < 0) {
        perror("Failed to open " DEVICE_PATH);
        return 1;
    }

    /* Flush buffer if requested */
    if (flush) {
        if (ioctl(fd, VSENSOR_FLUSH) < 0) {
            perror("ioctl FLUSH failed");
        } else {
            printf("Buffer flushed.\n");
        }
    }

    /* Set interval if requested */
    if (interval > 0) {
        if (ioctl(fd, VSENSOR_SET_INTERVAL, &interval) < 0) {
            perror("ioctl SET_INTERVAL failed");
            printf("Valid range: 100-10000 ms\n");
        } else {
            printf("Sampling interval set to %u ms.\n", interval);
        }
    }

    /* Show status */
    {
        uint32_t cur_interval;
        uint32_t cur_count;

        if (ioctl(fd, VSENSOR_GET_INTERVAL, &cur_interval) == 0)
            printf("Current interval: %u ms\n", cur_interval);

        if (ioctl(fd, VSENSOR_GET_COUNT, &cur_count) == 0)
            printf("Readings in buffer: %u\n", cur_count);
    }

    if (status_only) {
        close(fd);
        return 0;
    }

    /* Read loop */
    printf("\n--- Reading sensor data (Ctrl+C to stop) ---\n");
    printf("%-12s  %-12s  %s\n", "Temp (°C)", "Humidity (%)", "Timestamp (s)");
    printf("%-12s  %-12s  %s\n", "--------", "----------", "-------------");

    while (running) {
        struct vsensor_reading r;
        ssize_t ret;

        /* 
         * We need to close and reopen, or lseek back to 0,
         * because our driver returns EOF after one read.
         * lseek is simpler.
         */
        lseek(fd, 0, SEEK_SET);

        ret = read(fd, &r, sizeof(r));
        if (ret < 0) {
            perror("read failed");
            break;
        }
        if (ret == 0) {
            /* No data yet, wait and try again */
            usleep(100000);  /* 100ms */
            continue;
        }
        if (ret != sizeof(r)) {
            fprintf(stderr, "Short read: got %zd bytes, expected %zu\n",
                    ret, sizeof(r));
            break;
        }

        /* Convert and display */
        printf("%-12.3f  %-12.3f  %.3f\n",
               r.temperature_mC / 1000.0,
               r.humidity_mRH / 1000.0,
               r.timestamp_ns / 1000000000.0);

        count++;
        if (max_readings > 0 && count >= max_readings)
            break;

        /* Sleep for roughly the sampling interval */
        usleep(1000000);  /* 1 second between display updates */
    }

    printf("\n%u readings displayed.\n", count);
    close(fd);
    return 0;
}