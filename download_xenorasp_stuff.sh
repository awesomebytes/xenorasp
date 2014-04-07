#!/bin/sh

# This script downloads the necesary stuff for compiling a linux 3.10 kernel
# with xenomai 2.6.3 patches for raspberry pi
# It takes around 3 minutes to download in a fast connection.


# Create a directory to put all this, just in case
mkdir xenorasp
cd xenorasp

# Get the crosscompiler (270MB~)
wget https://github.com/raspberrypi/tools/archive/master.tar.gz
tar xzf master.tar.gz

# Get Raspberry Pi Linux kernel (500MB~)
git clone -b rpi-3.10.y --depth 1 git://github.com/raspberrypi/linux.git linux-rpi-3.10.y

# Get latest Xenomai (50MB~)
git clone git://git.xenomai.org/xenomai-head.git xenomai-head

# From this discussion: http://comments.gmane.org/gmane.linux.real-time.xenomai.users/18934
# Got 3.10.34 patches... copy from this repo
cp -r ../patches .

# Get official Xenomai I-pipe patches (What is this I-pipe thing? http://www.xenomai.org/index.php/FAQs#What_is_this_I-pipe_thing.3F_And_what_about_Adeos.3F_Are_they_related.3F)