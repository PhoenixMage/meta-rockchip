# Copyright (C) 2020 Garmin Ltd. or its subsidaries
# Released under the MIT license (see COPYING.MIT for the terms)

SOC_FAMILY = "rk3588"

DEFAULTTUNE ?= "cortexa76-cortexa55-crypto"

require conf/machine/include/soc-family.inc
require conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
require conf/machine/include/rockchip-defaults.inc
require conf/machine/include/rockchip-wic.inc

KBUILD_DEFCONFIG ?= "defconfig"
KERNEL_CLASSES = "kernel-fitimage"
KERNEL_IMAGETYPE = "fitImage"

UBOOT_SUFFIX ?= "itb"
UBOOT_ENTRYPOINT ?= "0x06000000"

PREFERRED_PROVIDER_u-boot ?= "u-boot-collabora"
PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-collabora"
PREFERRED_VERSION_u-boot-collabora ?= "2023.07-rc3"

PREFERRED_PROVIDER_virtual/kernel ?= "linux-collabora"
PREFERRED_VERSION_linux-collabora ?= "6.4-rc1%"
