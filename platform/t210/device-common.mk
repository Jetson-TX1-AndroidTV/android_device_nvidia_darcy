# NVIDIA Tegra development system
#
# Copyright (c) 2013-2016 NVIDIA Corporation.  All rights reserved.
#
# Common 32/64-bit userspace options

include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk
include $(LOCAL_PATH)/../../drivers/comms/comms.mk
-include $(TEGRA_TOP)/bct/t210/bct.mk
include $(LOCAL_PATH)/../../common/graphics/graphics.mk

PRODUCT_AAPT_CONFIG += mdpi hdpi xhdpi

DEVICE_ROOT := device/nvidia

NVFLASH_FILES_PATH :=

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# OPENGL AEP permission file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists,frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_PATH)/js_firmware.bin:system/etc/firmware/js_firmware.bin) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_PATH)/ct_firmware.bin:system/etc/firmware/ct_firmware.bin)

ifneq ($(TARGET_BUILD_VARIANT), user)
    PRODUCT_COPY_FILES += \
        $(call add-to-product-copy-files-if-exists, vendor/nvidia/loki/utils/cec/cecutil:$(TARGET_COPY_OUT_VENDOR)/bin/cecutil)
endif

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.e2190.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.e2220.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.jetson_e.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.jetson_cv.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.t18x-interposer.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.loki_e_lte.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.loki_e_wifi.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.loki_e_base.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.foster_e.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.foster_e_hdd.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.darcy.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.hawkeye.rc \
  $(LOCAL_PATH)/ueventd.t210ref.rc:root/ueventd.he2290.rc \
  $(LOCAL_PATH)/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
  device/nvidia/platform/loki/Vendor_0955_Product_7205.kl:system/usr/keylayout/Vendor_0955_Product_7205.kl \
  device/nvidia/platform/loki/Vendor_0955_Product_7210.kl:system/usr/keylayout/Vendor_0955_Product_7210.kl \
  device/nvidia/platform/loki/Vendor_0955_Product_7214.kl:system/usr/keylayout/Vendor_0955_Product_7214.kl \
  device/nvidia/platform/loki/Vendor_28de_Product_1102.kl:system/usr/keylayout/Vendor_28de_Product_1102.kl \
  device/nvidia/platform/loki/Vendor_28de_Product_1142.kl:system/usr/keylayout/Vendor_28de_Product_1142.kl \
  device/nvidia/platform/loki/Vendor_0955_Product_7210.idc:system/usr/idc/Vendor_0955_Product_7210.idc \
  device/nvidia/platform/loki/Vendor_0955_Product_7212.idc:system/usr/idc/Vendor_0955_Product_7212.idc \
  device/nvidia/platform/loki/Vendor_0955_Product_7213.idc:system/usr/idc/Vendor_0955_Product_7213.idc \
  device/nvidia/platform/loki/Vendor_0955_Product_7214.idc:system/usr/idc/Vendor_0955_Product_7214.idc \
  $(LOCAL_PATH)/../../common/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
  $(LOCAL_PATH)/raydium_ts.idc:system/usr/idc/touch.idc \
  $(LOCAL_PATH)/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc \
  $(LOCAL_PATH)/../../common/ussr_setup.sh:system/bin/ussr_setup.sh \
  $(LOCAL_PATH)/../../common/set_hwui_params.sh:system/bin/set_hwui_params.sh \
  $(LOCAL_PATH)/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
  $(LOCAL_PATH)/update_js_touch_fw.sh:system/bin/update_js_touch_fw.sh \
  $(LOCAL_PATH)/config_cameras.sh:system/bin/config_cameras.sh

PRODUCT_COPY_FILES += \
  frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
  frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
  $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
  $(LOCAL_PATH)/media_codecs_performance.xml:system/etc/media_codecs_performance.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.e2190.rc:root/init.e2190.rc \
    $(LOCAL_PATH)/init.e2220.rc:root/init.e2220.rc \
    $(LOCAL_PATH)/init.jetson_e.rc:root/init.jetson_e.rc \
    $(LOCAL_PATH)/init.jetson_cv.rc:root/init.jetson_cv.rc \
    $(LOCAL_PATH)/init.t18x-interposer.rc:root/init.t18x-interposer.rc \
    $(LOCAL_PATH)/init.t210.rc:root/init.t210.rc \
    $(LOCAL_PATH)/init.dualwifi.rc:root/init.dualwifi.rc \
    $(LOCAL_PATH)/init.loki_e_lte.rc:root/init.loki_e_lte.rc \
    $(LOCAL_PATH)/init.loki_e_wifi.rc:root/init.loki_e_wifi.rc \
    $(LOCAL_PATH)/init.loki_e_base.rc:root/init.loki_e_base.rc \
    $(LOCAL_PATH)/init.foster_e.rc:root/init.foster_e.rc \
    $(LOCAL_PATH)/init.foster_e_hdd.rc:root/init.foster_e_hdd.rc \
    $(LOCAL_PATH)/init.hawkeye.rc:root/init.hawkeye.rc \
    $(LOCAL_PATH)/init.he2290.rc:root/init.he2290.rc \
    $(LOCAL_PATH)/init.he2290.usb.rc:root/init.he2290.usb.rc \
    $(LOCAL_PATH)/init.loki_e_common.rc:root/init.loki_e_common.rc \
    $(LOCAL_PATH)/init.foster_e_common.rc:root/init.foster_e_common.rc \
    $(LOCAL_PATH)/init.loki_foster_e_common.rc:root/init.loki_foster_e_common.rc \
    $(LOCAL_PATH)/init.darcy.rc:root/init.darcy.rc \
    $(DEVICE_ROOT)/common/init.none.rc:root/init.none.rc \
    $(DEVICE_ROOT)/common/init.tegra_emmc.rc:root/init.tegra_emmc.rc \
    $(DEVICE_ROOT)/common/init.ray_touch.rc:root/init.ray_touch.rc \
    $(DEVICE_ROOT)/common/init.tegra_sata.rc:root/init.tegra_sata.rc \
    $(DEVICE_ROOT)/soc/t210/init.t210_common.rc:root/init.t210_common.rc \
    $(DEVICE_ROOT)/soc/t210/init.t18x-interposer_common.rc:root/init.t18x-interposer_common.rc \
    $(DEVICE_ROOT)/common/init.ussrd.rc:root/init.ussrd.rc \
    $(DEVICE_ROOT)/common/init.nv_dev_board.usb.rc:root/init.nv_dev_board.usb.rc \
    $(DEVICE_ROOT)/common/init.tlk.rc:root/init.tlk.rc \
    $(DEVICE_ROOT)/common/init.hdcp.rc:root/init.hdcp.rc

ifeq ($(PLATFORM_VERSION_LETTER_CODE),n)
PRODUCT_COPY_FILES += \
    $(DEVICE_ROOT)/common/init.tegra.rc:root/init.tegra.rc
else
PRODUCT_COPY_FILES += \
    $(DEVICE_ROOT)/common/init.tegra_m.rc:root/init.tegra.rc
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab_m.t210ref:root/fstab.e2190 \
    $(LOCAL_PATH)/fstab_m.t210ref:root/fstab.e2220 \
    $(LOCAL_PATH)/fstab_m.t210ref:root/fstab.t18x-interposer \
    $(LOCAL_PATH)/fstab_m.loki_e:root/fstab.loki_e_lte \
    $(LOCAL_PATH)/fstab_m.loki_e:root/fstab.loki_e_base \
    $(LOCAL_PATH)/fstab_m.loki_e:root/fstab.loki_e_wifi \
    $(LOCAL_PATH)/fstab_m.foster_e:root/fstab.foster_e \
    $(LOCAL_PATH)/fstab_m.foster_e_hdd:root/fstab.foster_e_hdd \
    $(LOCAL_PATH)/fstab_m.darcy:root/fstab.darcy \
    $(LOCAL_PATH)/fstab_m_usb.darcy:root/fstabusb.darcy \
    $(LOCAL_PATH)/fstab_m.hawkeye:root/fstab.hawkeye
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab_m.t210ref_encrypt:root/fstab.jetson_e \
    $(LOCAL_PATH)/fstab_m.t210ref_encrypt:root/fstab.jetson_cv
else
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab_m.t210ref:root/fstab.jetson_e \
    $(LOCAL_PATH)/fstab_m.t210ref:root/fstab.jetson_cv
endif
ifneq ($(filter user%,$(TARGET_BUILD_VARIANT)),)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/fstab_m.he2290_encrypt:root/fstab.he2290
else
PRODUCT_COPY_FILES += $(LOCAL_PATH)/fstab_m.he2290:root/fstab.he2290
endif

ifneq ($(findstring falcon_na_wf, $(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.falcon.rc:root/init.he2290.rc \
    $(LOCAL_PATH)/init.update_engine.rc:root/init.update_engine.rc \
    $(LOCAL_PATH)/fstab_m.falcon:root/fstab.he2290
endif

DEVICE_ROOT :=

# System power mode configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/power.loki_e_common.rc:system/etc/power.loki_e_lte.rc \
    $(LOCAL_PATH)/power.loki_e_common.rc:system/etc/power.loki_e_wifi.rc \
    $(LOCAL_PATH)/power.loki_e_common.rc:system/etc/power.loki_e_base.rc \
    $(LOCAL_PATH)/power.foster_e_common.rc:system/etc/power.foster_e.rc \
    $(LOCAL_PATH)/power.foster_e_common.rc:system/etc/power.foster_e_hdd.rc \
    $(LOCAL_PATH)/power.darcy.rc:system/etc/power.darcy.rc \
    $(LOCAL_PATH)/power.he2290.rc:system/etc/power.he2290.rc \
    $(LOCAL_PATH)/power.jetson_e.rc:system/etc/power.jetson_e.rc \
    $(LOCAL_PATH)/power.jetson_e.rc:system/etc/power.jetson_cv.rc \
    $(LOCAL_PATH)/power.jetson_e.rc:system/etc/power.t18x-interposer.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../common/cluster:system/bin/cluster \
    $(LOCAL_PATH)/../../common/cluster_get.sh:system/bin/cluster_get.sh \
    $(LOCAL_PATH)/../../common/cluster_set.sh:system/bin/cluster_set.sh \
    $(LOCAL_PATH)/../../common/dcc:system/bin/dcc \
    $(LOCAL_PATH)/../../common/hotplug:system/bin/hotplug \
    $(LOCAL_PATH)/../../common/mount_debugfs.sh:system/bin/mount_debugfs.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/enctune.conf:system/etc/enctune.conf

PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, vendor/nvidia/tegra/3rdparty/broadcom/gps/bin/bcm4752_next_64/glgps_nvidiategraandroid:system/bin/glgps_nvidiaTegra2android) \
    $(call add-to-product-copy-files-if-exists, vendor/nvidia/tegra/3rdparty/broadcom/gps/bin/bcm4752_next_64/gps.nvidiategraandroid.so:system/lib64/hw/gps.brcm.so)

# Nvidia Miracast
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../common/miracast/com.nvidia.miracast.xml:system/etc/permissions/com.nvidia.miracast.xml

# NvBlit JNI library
# PRODUCT_COPY_FILES += \
#    vendor/nvidia/tegra/graphics-partner/android/frameworks/Graphics/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml

ifneq ($(filter foster_e% darcy darcy_ironfist,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists, vendor/nvidia/tegra/tnspec_data/t210/tnspec_foster.json:tnspec.json)
else
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists, vendor/nvidia/tegra/tnspec_data/t210/tnspec.json:tnspec.json)
endif

#Hauppauge DualHD Tuner firmware
PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_PATH)/../../common/usbtuner/firmware/dvb-demod-si2168-b40-01.fw:$(TARGET_COPY_OUT_VENDOR)/firmware/dvb-demod-si2168-b40-01.fw)

# OTA version definition.  Depends on environment variable NV_OTA_VERSION
# being set prior to building.
ifneq ($(NV_OTA_VERSION),)
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.build.version.ota = $(NV_OTA_VERSION)
endif
