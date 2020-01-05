# Thinkpad ACPI 2nd fan control patch

Patch for vanilla Linux kernel 5.4.7 to enable 2nd fan control via sysfs.

Based on patches found in discussion: https://github.com/vmatare/thinkfan/issues/58

2nd fan control is enabled for machines which Bios Version begins with N2E, eg. Thinkpad X1 Extreme (1st GEN). You can add other prefixes in fan\_quirk\_table. 

Patch in file thinkpad\_acpi.2ndfan.patch. 

build\_install.sh is a helper script for Arch Linux to download the kernel sources, patch it, make and install module. Don't use without inspecting it and understanding what it does. The script probably won't be working on another distro.

If everything goes ok you will see fan2\_input, pwm2, pwm2\_enable under /sys/devices/platform/thinkpad\_hwmon/hwmon/hwmon*/.

