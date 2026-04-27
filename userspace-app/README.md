# vsensor_reader — Virtual Sensor Userspace Application

Command-line tool for reading and configuring the vsensor kernel module.

## Build

```bash
make                 # cross-compile for ARM
make install         # copy to rootfs overlay
make clean           # remove binary
```

## Usage

```bash
./vsensor_reader              # continuous reading (Ctrl+C to stop)
./vsensor_reader -s           # show status and exit
./vsensor_reader -n 5         # read 5 samples
./vsensor_reader -i 500       # set 500ms interval
./vsensor_reader -f           # flush buffer
./vsensor_reader -i 500 -f -n 10   # combine options
```

## Options

| Flag       | Description                              |
|------------|------------------------------------------|
| `-s`       | Show sensor status (interval, count)     |
| `-n COUNT` | Read COUNT samples then exit             |
| `-i MS`    | Set sampling interval (100–10000 ms)     |
| `-f`       | Flush ring buffer before reading         |
| `-h`       | Show help                                |
