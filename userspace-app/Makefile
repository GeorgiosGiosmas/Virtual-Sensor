CC ?= $(HOME)/buildroot/output/host/bin/arm-linux-gcc
CFLAGS := -Wall -Wextra -O2 -static
OVERLAY_DIR ?= $(HOME)/embedded-linux-qemu/rootfs-overlay/root

TARGET := vsensor_reader

all: $(TARGET)

$(TARGET): vsensor_reader.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f $(TARGET)

install: all
	mkdir -p $(OVERLAY_DIR)
	cp $(TARGET) $(OVERLAY_DIR)/

.PHONY: all clean install
