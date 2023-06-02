require recipes-bsp/u-boot/u-boot-common.inc
require recipes-bsp/u-boot/u-boot.inc

DEPENDS += "bc-native dtc-native python3-setuptools-native python3-pyelftools-native"

SRC_URI = "git://gitlab.collabora.com/hardware-enablement/rockchip-3588/u-boot.git;protocol=https;branch=2023.07-rc3-rock5b;lfs=0"

SRCREV = "a524abca384d400735485045b6ff65f99943f150"
