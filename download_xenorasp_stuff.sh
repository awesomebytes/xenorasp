#!/bin/sh

# Create a directory to put all this, just in case
mkdir xenorasp
cd xenorasp

# Get the crosscompiler
wget https://github.com/raspberrypi/tools/archive/master.tar.gz
tar xzf master.tar.gz

# Get Raspberry Pi Linux kernel
git clone -b rpi-3.8.y --depth 1 git://github.com/raspberrypi/linux.git linux-rpi-3.8.y

# Get latest Xenomai
git clone git://git.xenomai.org/xenomai-head.git xenomai-head

# Get official Xenomai I-pipe patches (What is this I-pipe thing? http://www.xenomai.org/index.php/FAQs#What_is_this_I-pipe_thing.3F_And_what_about_Adeos.3F_Are_they_related.3F)
mkdir patch
cd patch
wget http://git.xenomai.org/xenomai-2.6.git/plain/ksrc/arch/arm/patches/raspberry/ipipe-core-3.8.13-raspberry-post-2.patch
wget http://git.xenomai.org/xenomai-2.6.git/plain/ksrc/arch/arm/patches/raspberry/ipipe-core-3.8.13-raspberry-pre-2.patch
cd ..

# Download a minimal config, it's here in the repo, rpi_updated_xenomai_config
#wget https://www.dropbox.com/s/dcju74md5sz45at/rpi_xenomai_config

# Download raspberry firmware for boot partition
git clone -b master --depth 1 git://github.com/raspberrypi/firmware