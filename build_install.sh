#!/bin/bash

# kernel version number from currently running kernel!

KVER=`uname -r |cut -d- -f1`
wget https://www.kernel.org/pub/linux/kernel/v5.x/linux-$KVER.tar.xz
tar xJvf linux-$KVER.tar.xz
cd linux-$KVER
make mrproper
cp /usr/lib/modules/$(uname -r)/build/.config ./
cp /usr/lib/modules/$(uname -r)/build/Module.symvers ./
make oldconfig
make EXTRAVERSION=`uname -r|sed "s/$KVER//"` modules_prepare
cd drivers/platform/x86/
patch -p1 < ../../../../thinkpad_acpi.2ndfan.patch/thinkpad_acpi.2ndfan.patch
cd ../../../
make M=drivers/platform/x86
xz -f drivers/platform/x86/thinkpad_acpi.ko
mkdir /usr/lib/modules/`uname -r`/updates
cp -f drivers/platform/x86/thinkpad_acpi.ko.xz /usr/lib/modules/`uname -r`/updates
depmod -a
rmmod thinkpad_acpi
modprobe thinkpad_acpi

