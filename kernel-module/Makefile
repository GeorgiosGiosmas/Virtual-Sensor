# make

obj-m := vsensor.o

KERNEL_DIR ?= $(HOME)/buildroot/output/build/linux-6.18.7
CROSS_COMPILE ?= $(HOME)/buildroot/output/host/bin/arm-linux-

all:
	make -C $(KERNEL_DIR) M=$(PWD) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) modules

clean:
	make -C $(KERNEL_DIR) M=$(PWD) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) clean