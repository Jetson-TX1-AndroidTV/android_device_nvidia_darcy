#!/system/bin/sh

# Copyright (c) 2012-2017, NVIDIA CORPORATION. All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.


# vendor id defines
BRCM_SDIO=0x02d0
BRCM_PCIE=0x14e4

perform_enumeration() {
COUNT=0;
while [ $COUNT -le 2 ]; do
	#find hardware used and assigned corresponding mmc interface used for wifi chip
	for path in /sys/bus/sdio/devices/*; do
		vendor=$(cat $path/vendor)
		if [ "$vendor" = "$BRCM_SDIO" ]; then
			device=$(cat $path/device)
			/system/bin/log -t "wifiloader" -p i "WiFi SDIO VendorID: $vendor, DeviceID: $device"
			return;
		fi
	done
	for path in /sys/bus/pci/devices/*; do
		vendor=$(cat $path/vendor)
		if [ "$vendor" = "$BRCM_PCIE" ]; then
			device=$(cat $path/device)
			/system/bin/log -t "wifiloader" -p i "WiFi PCIE VendorID: $vendor, DeviceID: $device"
			return;
		fi
	done
	/system/bin/log -t "wifiloader" -p e "WiFi card is not available! try $COUNT"
	sleep 2
	COUNT=$(($COUNT+1))
done
}

load_modules() {
COUNT=0;
if [ -e /system/lib/modules/bluedroid_pm.ko ]; then
	/system/bin/log -t "wifiloader" -p i "Bluedroid_pm driver compiled as module"
	while [ $COUNT -le 5 ]; do
		if [ '1' -eq `lsmod | grep -c bluedroid_pm` ]; then
			/system/bin/log -t "wifiloader" -p i "Bluedroid_pm driver loaded at $COUNT iteration"
			break
		fi
		sleep 1
		COUNT=$(($COUNT+1))
		if [ $COUNT -eq 5 ]; then
			/system/bin/log -t "wifiloader" -p e "Failed to detect Bluedroid_pm driver load"
		fi
	done
fi

if [ $device = "0x4354" ]; then
	if [ -e /system/lib/modules/bcmdhd.ko ]; then
		/system/bin/log -t "wifiloader" -p i "load bcmdhd module"
		insmod /system/lib/modules/bcmdhd.ko
	fi
elif [ $device = "0x4355" -o $device = "0x43ef" ]; then
	if [ -e /system/lib/modules/bcmdhd_pcie.ko ]; then
		/system/bin/log -t "wifiloader" -p i "load bcmdhd_pcie module"
		insmod /system/lib/modules/bcmdhd_pcie.ko
	fi
fi
}

perform_enumeration
load_modules

if [ -z $vendor ]; then
	/system/bin/log -t "wifiloader" -p e "WiFi auto card detection fail"
fi

#bluetooth_log
touch /data/misc/bluedroid_log/data.txt
chown bluetooth:system /data/misc/bluedroid_log/data.txt
touch /data/misc/bluedroid_log/log.txt
chown bluetooth:system /data/misc/bluedroid_log/log.txt

#Scan policy
datafile="/data/misc/wifi/wifi_scan_config.conf"
etcfile="/etc/wifi/wifi_scan_config.conf"

if ! /system/bin/cmp -s $datafile $etcfile ; then
	/system/bin/log -t "wifiloader" -p i  "Linking Scan config file"
	/system/bin/rm $datafile
	/system/bin/ln -s $etcfile $datafile
fi
