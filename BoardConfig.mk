#
# Copyright (C) 2022-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Verified Boot
# Must be set BEFORE including BoardConfigCommon.mk, which hard-errors without it
# (it feeds BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX). Must match the vendor blobs:
# vendor/xiaomi/zeus is TheMuppets lineage-23.2 (OS3.0.4.0.VLBMIXM), and
# LineageOS android_device_xiaomi_zeus:lineage-23.2 pairs them with this value.
VENDOR_SECURITY_PATCH := 2026-02-01

# Inherit from xiaomi sm8450-common
include device/xiaomi/sm8450-common/BoardConfigCommon.mk

# Inherit from the proprietary version
include vendor/xiaomi/zeus/BoardConfigVendor.mk

DEVICE_PATH := device/xiaomi/zeus

# Audio
AUDIO_FEATURE_ENABLED_ULTRASOUND_PROXIMITY := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Screen density
TARGET_SCREEN_DENSITY := 560

# SELinux
# Suppresses cosmetic vendor->system-property denials. See sepolicy/vendor/dontaudit.te.
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# MIUI / Leica Camera
include device/xiaomi/miuicamera-zeus/BoardConfig.mk
