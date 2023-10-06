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
TARGET_SURFACEFLINGER_UDFPS_LIB := //hardware/xiaomi:libudfps_extension.xiaomi
TARGET_USES_FOD_ZPOS := true
SOONG_CONFIG_xiaomiVars_uses_fod_extension := $(TARGET_USES_FOD_ZPOS)

# Init
TARGET_INIT_VENDOR_LIB := libinit_davinci
TARGET_RECOVERY_DEVICE_MODULES := libinit_davinci

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE += androidboot.hardware.revision=V1
BOARD_KERNEL_CMDLINE += androidboot.android_dt_dir=/non-existent androidboot.boot_devices=soc/1d84000.ufshc
TARGET_KERNEL_CONFIG := vendor/davinci_defconfig

# Partitions
BOARD_SUPER_PARTITION_BLOCK_DEVICES := vendor system cust
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 1610612736
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3758096384
BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE := 1073741824
BOARD_SUPER_PARTITION_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_CUST_DEVICE_SIZE) )

BOARD_SUPER_PARTITION_GROUPS := davinci_dynpart
BOARD_DAVINCI_DYNPART_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304 )
BOARD_DAVINCI_DYNPART_PARTITION_LIST := odm product system system_ext vendor

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

ODM_MANIFEST_SKUS += \
    davinci

ODM_MANIFEST_DAVINCI_FILES := $(DEVICE_PATH)/manifest_davinci.xml

# Inherit from the proprietary version
include vendor/xiaomi/davinci/BoardConfigVendor.mk
