#!/bin/bash

# Being at xenorasp dir...
cd xenorasp

# Apply the patches
# Apply pre-patch to the arm patch... this is not very clean I've read, but works!
cd linux-rpi-3.10.y; patch -Np1 ../patch/ipipe-core-3.10.18-arm-1.patch ../patch/rpi-ipipe-core-3.10.34-arm-1.patch

# Apply xenomai ipipe core patch
xenomai-head/scripts/prepare-kernel.sh --arch=arm --linux=linux-rpi-3.10.y --adeos=patch/ipipe-core-3.10.18-arm-1.patch

# Apply post-patch
cd linux-rpi-3.10.y; patch -Np1 < ../patch/ipipe-core-3.10.34-arm-raspberry-post-1.patch
