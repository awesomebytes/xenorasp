#!/bin/bash

# Being at xenorasp dir...
cd xenorasp

# Compile kernel
# Create build directory
mkdir linux-rpi-3.10.y/build

# Optional... if you know what you are doing: Configure kernel
#cd linux-rpi-3.10.y
#make mrproper
#make ARCH=arm O=build menuconfig

# Use minimal kernel configuration
cp ../rpi_xenomai_2.6.3_linux_3.10_config linux-rpi-3.10.y/build/.config
cd linux-rpi-3.10.y
make mrproper
make ARCH=arm O=build oldconfig

# Actually compile! with -j8 on a 8 core 2GHz per core, this was like 5min
make ARCH=arm O=build CROSS_COMPILE=../../tools-master/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin/arm-bcm2708hardfp-linux-gnueabi- -j8

# Install modules
make ARCH=arm O=build INSTALL_MOD_PATH=dist modules_install

# Install headers
make ARCH=arm O=build INSTALL_HDR_PATH=dist headers_install
find build/dist/include \( -name .install -o -name ..install.cmd \) -delete

# The linux-rpi-3.10.y/build/dist directory contains the kernel headers and modules 
# while the kernel image is located at linux-rpi-3.10.y/build/arch/arm/boot/ .

# TODO: Automate this?
# Copy the zImage to boot
# Copy the dist to / of linux filesystem (include and lib is there)
# cd dist
# sudo cp -r * /media/YOUR_RASP_FILESYSTEM_ROOT 
# Add to config.txt the line
# kernel=zImage