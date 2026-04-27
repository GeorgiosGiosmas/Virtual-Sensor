# Embedded Linux Virtual Sensor — Custom Kernel Module on QEMU

A complete embedded Linux project demonstrating a custom kernel module and userspace application running on a Buildroot-based system emulated with QEMU. The project implements a virtual temperature/humidity sensor driver with a ring buffer, kernel timers, concurrency protection, and an ioctl-based control interface.

Built as a hands-on learning project following Chris Simmonds' *Mastering Embedded Linux Programming (3rd Edition)*.

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    USERSPACE                             │
│                                                         │
│  ┌─────────────────────────────────────────────────┐    │
│  │            vsensor_reader                        │    │
│  │                                                  │    │
│  │  open("/dev/vsensor")                            │    │
│  │  ioctl(fd, VSENSOR_SET_INTERVAL, &val)          │    │
│  │  ioctl(fd, VSENSOR_GET_COUNT, &val)             │    │
│  │  ioctl(fd, VSENSOR_FLUSH)                       │    │
│  │  read(fd, &reading, sizeof(reading))            │    │
│  │  close(fd)                                       │    │
│  └──────────────────┬──────────────────────────────┘    │
│                     │ system calls                       │
├─────────────────────┼───────────────────────────────────┤
│                     │ VFS dispatch                       │
│                  KERNEL                                  │
│                     │                                    │
│  ┌──────────────────▼──────────────────────────────┐    │
│  │            vsensor.ko (kernel module)            │    │
│  │                                                  │    │
│  │  ┌────────────────┐    ┌─────────────────────┐  │    │
│  │  │  kernel timer   │───▶  ring buffer [16]    │  │    │
│  │  │  (configurable  │    │                     │  │    │
│  │  │   interval)     │    │  vsensor_reading:   │  │    │
│  │  └────────────────┘    │   temperature_mC    │  │    │
│  │                         │   humidity_mRH      │  │    │
│  │  ┌────────────────┐    │   timestamp_ns      │  │    │
│  │  │   spinlock      │───▶  (concurrency       │  │    │
│  │  │                 │    │   protection)       │  │    │
│  │  └────────────────┘    └─────────────────────┘  │    │
│  │                                                  │    │
│  │  file_operations:                                │    │
│  │    .open     .release   .read                    │    │
│  │    .unlocked_ioctl      .llseek                  │    │
│  └──────────────────────────────────────────────────┘    │
│                                                         │
│  /dev/vsensor  (char device, dynamic major, minor 0)    │
│  /sys/class/vsensor/                                     │
└─────────────────────────────────────────────────────────┘
```

## Project Structure

```
embedded-linux-qemu/
├── kernel-module/
│   ├── vsensor.c            # Kernel module source
│   ├── vsensor.h            # Shared header (ioctl defs, data structs)
│   └── Makefile              # Out-of-tree kernel module build
├── userspace-app/
│   ├── vsensor_reader.c     # Userspace application source
│   └── Makefile              # Cross-compilation build
├── rootfs-overlay/
│   └── root/                 # Files overlaid onto Buildroot rootfs
│       ├── vsensor.ko
│       └── vsensor_reader
├── buildroot-config/
│   └── qemu_arm_versatile_defconfig   # Buildroot configuration
├── .gitignore
└── README.md
```

## Features

### Kernel Module (`vsensor.ko`)

- **Character device driver** with dynamic major number allocation via `alloc_chrdev_region`
- **Automatic `/dev/vsensor` creation** through `class_create` / `device_create` (no manual `mknod`)
- **Kernel timer** generating simulated temperature (20–25°C) and humidity (45–65%RH) readings at configurable intervals
- **Ring buffer** (16 entries) storing timestamped sensor readings with nanosecond precision
- **Spinlock protection** (`spin_lock_irqsave`) for safe concurrent access from timer context and process context
- **Binary data interface** using fixed-point integers (millicelsius, milli-percent) — no floating point in kernel space
- **ioctl control interface** for runtime configuration:
  - `VSENSOR_SET_INTERVAL` — set sampling interval (100–10000 ms)
  - `VSENSOR_GET_INTERVAL` — query current interval
  - `VSENSOR_GET_COUNT` — query number of buffered readings
  - `VSENSOR_FLUSH` — clear the ring buffer
- **Proper error handling** with `goto`-based cleanup in init and reverse-order teardown in exit

### Userspace Application (`vsensor_reader`)

- Opens `/dev/vsensor` and reads binary sensor data
- Converts fixed-point kernel data to human-readable floating-point display
- Command-line interface with multiple modes:
  - `-s` — status query (interval, buffer count)
  - `-n <count>` — read a fixed number of samples
  - `-i <ms>` — configure sampling interval via ioctl
  - `-f` — flush the ring buffer
  - Continuous mode with clean Ctrl+C (SIGINT) handling
- Cross-compiled with Buildroot toolchain for ARM target

## Prerequisites

- Linux host machine (Ubuntu/Debian recommended)
- ~10 GB free disk space
- QEMU (`qemu-system-arm`)
- Standard build tools (`build-essential`, `gcc`, `make`, `libncurses-dev`, `bison`, `flex`, `bc`, etc.)

### Install host dependencies (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install -y \
    build-essential gcc g++ make \
    libncurses5-dev libncurses-dev \
    bison flex texinfo \
    unzip bc python3 python3-pip \
    rsync cpio wget curl \
    qemu-system-arm
```

## Build Instructions

### 1. Clone and configure Buildroot

```bash
git clone https://github.com/buildroot/buildroot.git
cd buildroot
git checkout 2024.02.x
make qemu_arm_versatile_defconfig
```

Set the rootfs overlay in `make menuconfig`:

> System configuration → Root filesystem overlay directories → `path/to/embedded-linux-qemu/rootfs-overlay`

```bash
make -j$(nproc)
```

### 2. Build the kernel module

```bash
cd kernel-module/
make
```

The Makefile cross-compiles `vsensor.ko` against the Buildroot kernel using the Buildroot toolchain:

```makefile
KERNEL_DIR ?= $(HOME)/buildroot/output/build/linux-6.18.7
CROSS_COMPILE ?= $(HOME)/buildroot/output/host/bin/arm-linux-
```

### 3. Build the userspace application

```bash
cd userspace-app/
make
```

Or manually:

```bash
$(HOME)/buildroot/output/host/bin/arm-linux-gcc \
    -o vsensor_reader vsensor_reader.c -static
```

### 4. Deploy to rootfs overlay

```bash
cp kernel-module/vsensor.ko rootfs-overlay/root/
cp userspace-app/vsensor_reader rootfs-overlay/root/
cd ~/buildroot && make    # rebuild rootfs with overlay
```

### 5. Boot in QEMU

```bash
qemu-system-arm \
    -M versatilepb \
    -m 256 \
    -kernel output/images/zImage \
    -dtb output/images/versatile-pb.dtb \
    -drive file=output/images/rootfs.ext2,if=scsi,format=raw \
    -append "root=/dev/sda console=ttyAMA0,115200" \
    -nographic
```

## Usage

### Load the kernel module

```bash
insmod vsensor.ko
# vsensor: registered with major 251, minor 0
# Virtual Sensor loaded Successfully

ls -la /dev/vsensor
# crw-------  1 root root  251, 0 Jan  1 00:00 /dev/vsensor
```

### Query sensor status

```bash
./vsensor_reader -s
# Current interval: 1000 ms
# Readings in buffer: 16
```

### Read sensor data

```bash
# Read 3 samples
./vsensor_reader -n 3
# Temp (°C)    Humidity (%)  Timestamp (s)
# --------     ----------    -------------
# 21.657       50.238        75.915
# 24.494       60.154        76.955
# 21.649       52.339        77.995

# Continuous reading (Ctrl+C to stop)
./vsensor_reader
```

### Configure the sensor

```bash
# Set 500ms sampling interval, flush buffer, read 5 samples
./vsensor_reader -i 500 -f -n 5
# Buffer flushed.
# Sampling interval set to 500 ms.
# Current interval: 500 ms
# Readings in buffer: 0
```

### Unload the module

```bash
rmmod vsensor
# Virtual Sensor unloaded Successfully

ls /dev/vsensor
# ls: /dev/vsensor: No such file or directory
```

### Inspect raw binary data

```bash
hexdump -C /dev/vsensor
# 00000000  c0 5b 00 00 e4 c3 00 00  28 44 5a d9 0f 00 00 00
# Bytes 0-3:  temperature_mC = 0x5BC0 = 23488 → 23.488°C
# Bytes 4-7:  humidity_mRH   = 0xC3E4 = 50148 → 50.148%RH
# Bytes 8-15: timestamp_ns (nanoseconds since boot)
```

## Key Design Decisions

**Why fixed-point integers instead of floats?**
The Linux kernel does not use floating-point arithmetic. FPU registers are not saved/restored on context switches by default, so using floats in kernel code can corrupt userspace FPU state. The standard approach is fixed-point: millicelsius (23500 = 23.5°C), milli-percent (61200 = 61.2%RH). This matches the convention used by the kernel's IIO (Industrial I/O) subsystem.

**Why a ring buffer?**
A ring buffer naturally handles the producer-consumer pattern: the timer produces readings at a fixed rate, and userspace consumes them on demand. Old data is automatically overwritten, so the buffer never grows unbounded. This is the same pattern used in real sensor drivers and data acquisition systems.

**Why spinlocks?**
The kernel timer callback runs in atomic context (softirq), where sleeping is not allowed. Mutexes can sleep, so they cannot be used here. Spinlocks are the correct synchronization primitive when shared state is accessed from both process context (`read`, `ioctl`) and atomic context (timer callback). We use `spin_lock_irqsave` to also disable local interrupts, preventing deadlock if an interrupt arrives while holding the lock.

**Why binary ioctl instead of sysfs or text?**
For a sensor driver with structured data, a binary ioctl interface is more efficient and type-safe than parsing text strings. It also demonstrates understanding of the full character device interface (`read` + `ioctl`), which is what professional embedded Linux drivers use. Sysfs would be appropriate for individual configuration knobs but not for streaming data.

**Why Buildroot over Yocto?**
Buildroot provides a simpler, faster build cycle (~20–40 min vs 1–3 hours) while teaching the same underlying Linux concepts (cross-compilation, kernel configuration, root filesystem construction, init systems). The project is designed to be portable to Yocto as a follow-up exercise.

## Concepts Demonstrated

- Cross-compilation for ARM targets using Buildroot toolchain
- Linux kernel module development (out-of-tree build)
- Character device driver registration (`alloc_chrdev_region`, `cdev`, `class_create`, `device_create`)
- Kernel-userspace data transfer (`copy_to_user`, `copy_from_user`)
- Kernel timers and periodic task scheduling (`timer_setup`, `mod_timer`)
- Concurrency and synchronization in kernel space (`spinlock`, `spin_lock_irqsave`)
- ioctl interface design (`_IOW`, `_IOR`, `_IO` macros)
- Ring buffer data structure in kernel context
- Signal handling in userspace applications
- Buildroot root filesystem overlay mechanism
- QEMU-based embedded Linux development workflow

## Hardware Portability

This project runs on QEMU (`qemu_arm_versatile_defconfig`) but is designed for easy migration to a Raspberry Pi 4:

1. Switch Buildroot defconfig to `raspberrypi4_defconfig`
2. Replace simulated data generation with real sensor readings (e.g., DHT11 over GPIO, BME280 over I2C)
3. Flash the resulting `sdcard.img` to a microSD card
4. The kernel module and userspace application require minimal changes — the character device interface remains identical

## References

- Chris Simmonds, *Mastering Embedded Linux Programming*, 3rd Edition (Packt, 2021)
- [Buildroot User Manual](https://buildroot.org/downloads/manual/manual.html)
- [Linux Device Drivers, 3rd Edition](https://lwn.net/Kernel/LDD3/) (free online)
- [Linux kernel documentation — driver API](https://www.kernel.org/doc/html/latest/)

## Author

**George Rafail Giosmas**

## License

GPL v2 — Kernel modules must be GPL-licensed to access the full kernel API.
