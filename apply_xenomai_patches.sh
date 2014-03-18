#!/bin/bash

# Being at xenorasp dir...
cd xenorasp

# Apply the patches
# Apply pre-patch
cd linux-rpi-3.8.y; patch -Np1 < ../patch/ipipe-core-3.8.13-raspberry-pre-2.patch

# Apply xenomai ipipe core patch
xenomai-head/scripts/prepare-kernel.sh --arch=arm --linux=linux-rpi-3.8.y --adeos=xenomai-head/ksrc/arch/arm/patches/ipipe-core-3.8.13-arm-3.patch

# Apply post-patch
cd linux-rpi-3.8.y; patch -Np1 < ../patch/ipipe-core-3.8.13-raspberry-post-2.patch
