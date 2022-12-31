#
# Copyright (C) 2019-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from davinci device
$(call inherit-product, device/xiaomi/davinci/device.mk)
TARGET_SUPPORTS_OMX_SERVICE := false

# Inherit some common DerpFest stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
DERPFEST_BUILD_TYPE := Official

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_davinci
PRODUCT_DEVICE := davinci
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_SYSTEM_NAME := davinci

PRODUCT_BUILD_PROP_OVERRIDES += \
     PRIVATE_BUILD_DESC="davinci-user 11 RKQ1.200826.002 V12.1.4.0.RFJMIXM release-keys" \
     TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)
 
BUILD_FINGERPRINT := Xiaomi/davinci/davinci:11/RKQ1.200826.002/V12.1.4.0.RFJMIXM:user/release-keys
