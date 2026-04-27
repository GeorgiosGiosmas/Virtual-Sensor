# vsensor — Virtual Sensor Kernel Module

Linux character device driver that simulates a temperature/humidity sensor.

## Files

- `vsensor.c` — Kernel module source
- `vsensor.h` — Shared header (struct definitions, ioctl commands)
- `Makefile` — Out-of-tree kernel module build

## Build

```bash
make                 # build vsensor.ko
make install         # copy to rootfs overlay
make clean           # remove build artifacts
```

## Device Interface

Once loaded with `insmod vsensor.ko`, the module creates `/dev/vsensor` (character device).

**read()** — Returns one `struct vsensor_reading` (16 bytes, binary).

**ioctl()** — Control commands defined in `vsensor.h`:
- `VSENSOR_SET_INTERVAL` — set sampling rate (100–10000 ms)
- `VSENSOR_GET_INTERVAL` — query current rate
- `VSENSOR_GET_COUNT` — query buffered reading count
- `VSENSOR_FLUSH` — clear ring buffer
