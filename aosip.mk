#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from davinci device
$(call inherit-product, device/xiaomi/davinci/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/aosip/config/common_full_phone.mk)

# GApps
$(call inherit-product-if-exists, vendor/gapps/config.mk)

# PixelStyle
$(call inherit-product-if-exists, vendor/pixelstyle/config.mk)

# GApps targets
TARGET_GAPPS_ARCH := arm64
IS_PHONE := true

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := aosip_davinci
PRODUCT_DEVICE := davinci
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.product.model
