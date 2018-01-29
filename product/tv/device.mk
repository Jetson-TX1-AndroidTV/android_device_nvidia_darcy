# Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.

# Common stuff for tv products

PRODUCT_LOCALES := en_US

# Include drawables for various densities.
PRODUCT_AAPT_CONFIG := normal large xlarge tvdpi hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES += \
ro.com.google.clientidbase=android-nvidia

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := tv

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

DEVICE_PACKAGE_OVERLAYS := device/nvidia/platform/t210/overlay_

$(call inherit-product-if-exists, device/google/atv/products/atv_base.mk)

ifneq ($(wildcard 3rdparty/google/gms-apps/tv),3rdparty/google/gms-apps/tv)
    $(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)
endif
