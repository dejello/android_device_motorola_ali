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

LOCAL_PATH := device/motorola/ali
DEVICE_PATH := device/motorola/ali

BOARD_VENDOR := motorola-qcom

#
# Display
#
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2160

#
# Board
#
TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_PLATFORM_GPU := qcom-adreno506
TARGET_BOOTLOADER_BOARD_NAME := ali
TARGET_NO_BOOTLOADER := true

#
# Architecture
#
#TARGET_ARCH := arm
#TARGET_ARCH_VARIANT := armv7-a-neon
#TARGET_CPU_ABI := armeabi-v7a
#TARGET_CPU_ABI2 := armeabi
#TARGET_CPU_VARIANT := cortex-a53
# 64bit testing, comment out the above and uncomment below to try
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

#
# Binder API version
#
TARGET_USES_64_BIT_BINDER := true

#
# Asserts
#
# TARGET_OTA_ASSERT_DEVICE := ali,ali_retail

# Crypto
#TARGET_HW_DISK_ENCRYPTION := true
#TARGET_KEYMASTER_WAIT_FOR_QSEE := true

#
# Partitions - pulled from ali hardware
#
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672		# 22528    * 1024 mmcblk0p36
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456		# 262144   * 1024 mmcblk0p51
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23171072		# 22628    * 1024 mmcblk0p37
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3271557120		# 3194880  * 1024 mmcblk0p52
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26419903488	# 25800687 * 1024 mmcblk0p53

#
# Kernel
#
# 32bit vs 64bit:
#TARGET_KERNEL_ARCH := arm # 32bit
#BOARD_KERNEL_IMAGE_NAME := zImage # 32bit
#TARGET_KERNEL_CROSS_COMPILE_PREFIX = arm-linux-androideabi- # 32bit
TARGET_KERNEL_ARCH := arm64 # 64bit
BOARD_KERNEL_IMAGE_NAME := Image.gz # 64bit
TARGET_KERNEL_CROSS_COMPILE_PREFIX = aarch64-linux-android- # 64bit

TARGET_KERNEL_CONFIG := ali_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/msm8953
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 vmalloc=400M
BOARD_KERNEL_LZ4C_DT := true
BOARD_KERNEL_SEPARATED_DT := true
BOARD_DTBTOOL_ARGS := -2
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
PRODUCT_VENDOR_KERNEL_HEADERS :=  $(DEVICE_PATH)/kernel-headers
TARGET_CUSTOM_DTBTOOL := dtbTool_custom # using custom for minimal twrp build

#
# Recovery
#
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SUPPRESS_SECURE_ERASE := true

#
# Recovery - twrp
#
RECOVERY_VARIANT := twrp
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_RECOVERY_SWIPE := true
BOARD_USES_MMCUTILS := true
BOARD_SUPPRESS_EMMC_WIPE := true
TW_EXCLUDE_SUPERSU := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_INCLUDE_CRYPTO := true
TW_DEFAULT_BRIGHTNESS := 128
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
ALLOW_MISSING_DEPENDENCIES=true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab

