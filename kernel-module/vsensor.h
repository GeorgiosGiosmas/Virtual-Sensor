#ifndef _VSENSOR_H
#define _VSENSOR_H

#include <linux/ioctl.h>
#include <linux/types.h>

struct vsensor_reading {
    __s32 temperature_mC;
    __s32 humidity_mRH;
    __u64 timestamp_ns;
};

/* ioctl magic number — pick a unique letter */
#define VSENSOR_IOC_MAGIC  'V'

/* Set timer interval in milliseconds */
#define VSENSOR_SET_INTERVAL  _IOW(VSENSOR_IOC_MAGIC, 1, __u32)

/* Get current timer interval */
#define VSENSOR_GET_INTERVAL  _IOR(VSENSOR_IOC_MAGIC, 2, __u32)

/* Get number of readings in ring buffer */
#define VSENSOR_GET_COUNT     _IOR(VSENSOR_IOC_MAGIC, 3, __u32)

/* Flush all readings from ring buffer */
#define VSENSOR_FLUSH         _IO(VSENSOR_IOC_MAGIC, 4)

#endif