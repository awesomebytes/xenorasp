#!/bin/bash

# Being at xenorasp dir...
cd xenorasp

# Compile kernel
# Create build directory
mkdir linux-rpi-3.8.y/build

# Optional... if you know what you are doing: Configure kernel
#cd linux-rpi-3.8.y
#make mrproper
#make ARCH=arm O=build menuconfig

# Use minimal kernel configuration
cp rpi_updated_xenomai_config linux-rpi-3.8.y/build/.config
cd linux-rpi-3.8.y
make mrproper
make ARCH=arm O=build oldconfig

# You will get asked a few questions, just hit enter... no, here we should use the updated xenomai config!

make ARCH=arm O=build CROSS_COMPILE=../../tools-master/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin/arm-bcm2708hardfp-linux-gnueabi- -j4

