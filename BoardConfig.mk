#
# Copyright (C) 2019-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Boot
BOARD_BOOT_HEADER_VERSION := 1

# Display density
TARGET_SCREEN_DENSITY := 440

# Inherit from sm6150-common
include device/xiaomi/sm6150-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/davinci

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Assert
TARGET_OTA_ASSERT_DEVICE := davinci,davinciin

# Audio
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true

# Fingerprint
TARGET_SURFACEFLINGER_UDFPS_LIB := //$(COMMON_PATH):libudfps_extension
TARGET_USES_FOD_ZPOS := true
SOONG_CONFIG_xiaomiVars_uses_fod_extension := $(TARGET_USES_FOD_ZPOS)

# Init
TARGET_INIT_VENDOR_LIB := libinit_davinci
TARGET_RECOVERY_DEVICE_MODULES := libinit_davinci

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE += androidboot.hardware.revision=V1
TARGET_KERNEL_CONFIG := vendor/davinci_defconfig

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

ODM_MANIFEST_SKUS += \
    davinci

ODM_MANIFEST_DAVINCI_FILES := $(DEVICE_PATH)/manifest_davinci.xml

# Inherit from the proprietary version
include vendor/xiaomi/davinci/BoardConfigVendor.mk
