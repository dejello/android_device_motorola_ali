#
# Copyright (C) 2018 The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/ali

BOARD_VENDOR := motorola-qcom

# All of the if statements are ugly....  I don't care right now.
# Testing between 32 bit (arm) and 64 bit (arm64), added only to make changes easier
# If arm64 is not defined it'll assume arm.
# arm or arm64 - currently arm64 is not decrypting and causes focaltech (touchscreen) to log some error
ARCH_TYPE := arm
# use the prebuilt kernel and dt.img?
KERNEL_PREBUILT := true


#
# Board
#
TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_PLATFORM_GPU := qcom-adreno506
TARGET_BOOTLOADER_BOARD_NAME := msm8953
TARGET_NO_BOOTLOADER := true

#
# Architecture
#
ifeq ($(ARCH_TYPE),arm64)
     # arm64 - 64bit
     TARGET_ARCH := arm64
     TARGET_ARCH_VARIANT := armv8-a
     TARGET_CPU_ABI := arm64-v8a
     TARGET_CPU_ABI2 :=
     TARGET_CPU_VARIANT := cortex-a53
     TARGET_2ND_ARCH := arm
     TARGET_2ND_ARCH_VARIANT := armv7-a-neon
     TARGET_2ND_CPU_ABI := armeabi-v7a
     TARGET_2ND_CPU_ABI2 := armeabi
     TARGET_2ND_CPU_VARIANT := cortex-a7
     # 64bit Binder API version
     TARGET_USES_64_BIT_BINDER := true
else
     # If arm64 is not defined, then assume arm - 32bit
     TARGET_ARCH := arm
     TARGET_ARCH_VARIANT := armv7-a-neon
     TARGET_CPU_ABI := armeabi-v7a
     TARGET_CPU_ABI2 := armeabi
     TARGET_CPU_VARIANT := cortex-a7
endif

#
# Asserts
#
# too much confusion on the Moto G6 forums, this is for Ali only (G6, not G6 Play or G6 Plus)
TARGET_OTA_ASSERT_DEVICE := ali,ali_retail

#
# Encryption
#
#BOARD_USES_QCOM_HARDWARE := true
#TARGET_CRYPTFS_HW_PATH := $(DEVICE_PATH)/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true
TARGET_PROVIDES_KEYMASTER := true
TW_CRYPTO_USE_SYSTEM_VOLD := qseecomd hwservicemanager keymaster-3-0
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true

#
# Partitions - pulled from ali hardware
#
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672		#    22528 * 1024 mmcblk0p36
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456		#   262144 * 1024 mmcblk0p51
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432		#    32768 * 1024 mmcblk0p29
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23171072		#    22628 * 1024 mmcblk0p37
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3271557120		#  3194880 * 1024 mmcblk0p52
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26419903488	# 25800687 * 1024 mmcblk0p53
BOARD_VENDORIMAGE_PARTITION_SIZE := 671088640		#   655360 * 1024 mmcblk0p50
# fs types
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

#
# Kernel
#
# Testing between 32 bit (arm) and 64 bit (arm64), added only to make changes easier
ifeq ($(ARCH_TYPE),arm64)
     # arm64
     BOARD_KERNEL_IMAGE_NAME := Image.gz
     TARGET_KERNEL_ARCH := arm64
     TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
else
     # If arm64 is not defined, then assume arm
     BOARD_KERNEL_IMAGE_NAME := zImage
     TARGET_KERNEL_ARCH := arm
     TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
endif

ifeq ($(KERNEL_PREBUILT),true)
     TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dt-lz4.img
     ifeq ($(ARCH_TYPE),arm64)
          # arm64
          TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
     else
          # If arm64 is not defined, then assume arm
          TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage
     endif
else
     BOARD_DTBTOOL_ARGS := -2
     BOARD_KERNEL_LZ4C_DT := true
     TARGET_KERNEL_CONFIG := ali_defconfig
     TARGET_KERNEL_SOURCE := kernel/motorola/msm8953
endif

BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := \
     console=ttyHSL0,115200,n8 \
     androidboot.console=ttyHSL0 \
     androidboot.hardware=qcom \
     user_debug=30 \
     msm_rtb.filter=0x237 \
     ehci-hcd.park=3 \
     androidboot.bootdevice=7824900.sdhci \
     lpm_levels.sleep_disabled=1 \
     vmalloc=400M \
     androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
LZMA_RAMDISK_TARGETS := recovery
PRODUCT_VENDOR_KERNEL_HEADERS :=  $(DEVICE_PATH)/kernel-headers
#TARGET_CUSTOM_DTBTOOL := dtbTool_custom

#
# Recovery
#
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SUPPRESS_SECURE_ERASE := true

#
# Recovery - twrp
#
RECOVERY_VARIANT := twrp
ALLOW_MISSING_DEPENDENCIES=true
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_RECOVERY_SWIPE := true
BOARD_USES_MMCUTILS := true
BOARD_SUPPRESS_EMMC_WIPE := true
RECOVERY_SDCARD_ON_DATA := true
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/soc/7000000.ssusb/7000000.dwc3/gadget/lun0/file"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 128
TW_EXCLUDE_SUPERSU := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_THEME := portrait_hdpi
#TW_CUSTOM_THEME := $(DEVICE_PATH)/recovery/theme/Theme_CryptoGreen

#TW_USE_TOOLBOX := true

#
# TWRP Debug Flags
#
#TWRP_INCLUDE_LOGCAT := true
#TARGET_RECOVERY_DEVICE_MODULES += strace debuggerd
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_OPTIONAL_EXECUTABLES)/strace $(TARGET_OUT_EXECUTABLES)/debuggerd
#TARGET_RECOVERY_DEVICE_MODULES += twrpdec
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/twrpdec
#TW_CRYPTO_SYSTEM_VOLD_DEBUG := true

#
#Treble
#
BOARD_NEEDS_VENDORIMAGE_SYMLINK := false
TARGET_COPY_OUT_VENDOR := vendor
BOARD_HAS_LARGE_FILESYSTEM := true

