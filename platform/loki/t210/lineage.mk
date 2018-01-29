# Inherit device configuration for darcy.
$(call inherit-product, device/nvidia/platform/loki/t210/darcy.mk)

# Inherit some common lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tv.mk)

PRODUCT_NAME := lineage_t210
PRODUCT_DEVICE := t210
