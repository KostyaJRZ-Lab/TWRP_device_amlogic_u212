#
# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_FOLDER := device/amlogic/u212

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true
TARGET_USES_64_BIT_BINDER := true
ENABLE_CPUSETS := true

# Compression
LZMA_RAMDISK_TARGETS := recovery
BOARD_HAS_SMALL_RECOVERY = true

# Platform
BOARD_VENDOR := amlogic
TARGET_SOC := s905x2
TARGET_BOARD_HARDWARE := amlogic
TARGET_BOARD_PLATFORM := g12a
TARGET_BOARD_PLATFORM_GPU := mali-g31mp2
TARGET_BOOTLOADER_BOARD_NAME := u212
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Graphics
BOARD_EGL_CFG := $(DEVICE_FOLDER)/egl.cfg
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
MAX_VIRTUAL_DISPLAY_DIMENSION := 1920
TARGET_APP_LAYER_USE_CONTINUOUS_BUFFER := true
HWC_ENABLE_PRIMARY_HOTPLUG := true
ENABLE_PRIMARY_DISPLAY_HOTPLUG := true

# MESONHWC CONFIG
USE_HWC2 := true
HWC_DISPLAY_NUM := 1
HWC_PRIMARY_FRAMEBUFFER_WIDTH := 1920
HWC_PRIMARY_FRAMEBUFFER_HEIGHT := 1080
HWC_PRIMARY_CONNECTOR_TYPE := "hdmi"

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/prebuilt/zImage
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_FOLDER)/prebuilt/dtbo.img

# Kernel CMDLINE
BOARD_KERNEL_CMDLINE := \
    androidboot.dtbo_idx=0 \
    buildvariant=eng

# MKBOOTIMG Args
BOARD_MKBOOTIMG_ARGS := \
    --kernel_offset 0x01080000 --ramdisk_offset 0x01000000 --second_offset 0x00F00000 --tags_offset 0x00000100 \
    --second $(DEVICE_FOLDER)/prebuilt/second --header_version 1

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x80000000

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Android Verified Boot
BOARD_AVB_ENABLE := false

# Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TWRP_EVENT_LOGGING := false

# Crypto
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31

# TWRP specific build flags
RECOVERY_VARIANT := twrp
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_FORCE_PIXEL_FORMAT := "RGB_565"
TW_THEME := landscape_hdpi
TW_BRIGHTNESS_PATH := "/sys/devices/platform/gpioleds/leds/sys_led/brightness"
TW_NO_REBOOT_BOOTLOADER := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_CRYPTO := true
TW_EXTRA_LANGUAGES := true
TW_USE_NEW_MINADBD := true
TW_USE_TOOLBOX := true
TW_NO_BATT_PERCENT := true
TW_NO_SCREEN_TIMEOUT := true
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_LEGACY_PROPS := true
TW_DEVICE_VERSION := $(shell date '+%Y%m%d') by KostyaJRZ

# Platform version
PLATFORM_VERSION := 16.1.0
