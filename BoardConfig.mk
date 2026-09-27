#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/tanix/x4

## Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ohm

## DTB
TARGET_DTB_NAME := sc2_s905x4_ah212_drm
TARGET_DTBO_NAME := android_overlay_dt
BOARD_KERNEL_SEPARATED_DTBO := true

## Kernel
TARGET_KERNEL_PLATFORM_TARGET := x4
TARGET_KERNEL_SOURCE := vendor/tanix/x4-build
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/vendor_dlkm.modules.load))
BOOT_KERNEL_MODULES := $(strip $(shell cat $(DEVICE_PATH)/vendor_boot.modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

## Partitions
BOARD_SUPER_PARTITION_SIZE := 1887436800

## Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

## Recovery
TARGET_RECOVERY_DEVICE_DIRS += vendor/tanix/x4/proprietary

## Wi-Fi
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

## Include the common tree BoardConfig makefile
include device/amlogic/ne-common/BoardConfigCommon.mk

## Include the proprietary BoardConfig makefile
include vendor/tanix/x4/BoardConfigVendor.mk
