# Thinkpad ACPI 2nd fan control patch

Patch for vanilla Linux kernel 5.4.7 to enable 2nd fan control via sysfs.

Based on patches found in discussion: https://github.com/vmatare/thinkfan/issues/58

2nd fan control is enabled for these models (bios version prefix):
Thinkpad P50 (N1E)
Thinkpad P51 (N1U)
Thinkpad P52 (N2C)
Thinkpad P70 (N1D)
Thinkpad P71 (N1T)
Thinkpad P72 (N2C)
Thinkpad P1 1st gen (N2E)
Thinkpad X1 Extreme 1st gen (N2E)
Thinkpad P1 2nd gen (N2O)
Thinkpad X1 Extreme 2nd gen (N2O)

You can add other models/prefixes in fan\_quirk\_table. Let me know if you know another thinkpad model with 2nd fan which should be separately controlled, so I can add it to the list. 

Patch in the file thinkpad\_acpi.2ndfan.patch. 

build\_install.sh is a helper script for Arch Linux to download the kernel sources, patch it, make and install module. Don't use without inspecting it and understanding what it does. The script probably won't be working on another distro.

If everything goes ok you will see fan2\_input, pwm2, pwm2\_enable under /sys/devices/platform/thinkpad\_hwmon/hwmon/hwmon*/.

Note: /proc/acpi/ibm/fan can't be used to separately control two fans. It is possible only via /sys/.
