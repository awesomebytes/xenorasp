xenorasp
========

Raspberry Pi with Xenomai using Ipipe patches

Using raspberry linux 3.10.y and Xenomai 2.6.3


========
* Instructions
========

Get some recent raspberry pi working image, I tested:
```
Current Raspbian image from: http://www.raspberrypi.org/downloads
Minimal raspbian: http://sourceforge.net/projects/minibian/
```

Here I will do it with latest raspbian image.
I recommend torrent but I don't expect everyone to be able to do it, so here is a command line
```
wget http://downloads.raspberrypi.org/raspbian_latest
```

Be sure to check it's SHA-1 Checksum ! (in my case)
```
sha1sum 2014-01-07-wheezy-raspbian.zip
```

Extract the image
```
unzip 2014-01-07-wheezy-raspbian.zip
``

Install it in your SD card
You can get instructions here: http://elinux.org/RPi_Easy_SD_Card_Setup
I used ImageWriter
```
sudo apt-get install usb-imagewriter
sudo imagewriter
```
Maybe when opening it your SD card does not get recognized by the program
You can use Gparted (sudo apt-get install gparted) to delete all the partitions and leave an empty ext4 partition, for example
then write the image to the SD card

*Test that it boots!
user / pass = pi / raspberry

* I recommend checking out what every script does first!
Now you can execute (in this order)
```
./1_download_xenorasp_stuff.sh
./2_apply_xenomai_ipipe_patches.sh
./3_compile_kernel.sh
```

And you should have a crosscompiled kernel for your raspberry pi!
Now you should copy your new kernel image and related libraries to your SD card,
this instruction are also found in 3_compile_kernel.sh if you open it in a text editor


Copy the zImage to boot
```
cp linux-rpi-3.10.y/build/arch/arm/boot/zImage /media/YOUR_RASP_BOOT_PARTITION
```
Copy the dist to / of linux filesystem (include and lib is there)
```
cd dist
sudo cp -r * /media/YOUR_RASP_FILESYSTEM_ROOT 
```

Add to config.txt of your BOOT partition the line
```
kernel=zImage
```


Once up and running...
Then you should get userspace xenomai code and examples in the board:

Connect to your raspberry... I plug it into my router and search for the newest ip
```
nmap -sP 192.168.1.0/24
```
```
ssh pi@THE.IP.OF.YOUR.BOARD
```
Remember! password: raspberry

Download and uncompress the stuff
```
wget http://download.gna.org/xenomai/stable/xenomai-2.6.2.1.tar.bz2
tar -jxvf xenomai-2.6.2.1.tar.bz2
cd xenomai-2.6.2.1
```

This takes a couple of minutes
```
./configure
```

This takes another couple of minutes...
```
make
sudo make install
```

Test your xenomai install
```
cd /usr/xenomai/bin
sudo ./xeno latency
```


