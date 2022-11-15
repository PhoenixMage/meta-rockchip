require recipes-bsp/u-boot/u-boot-common.inc
require recipes-bsp/u-boot/u-boot.inc

SRC_URI = " \
    git://github.com/radxa/u-boot.git;protocol=https;branch=stable-4.19-rock3;name=source \
    file://diag.cfg \
    file://fix-its-creation.patch \
    https://github.com/rockchip-linux/rkbin/raw/master/bin/rk35/rk3568_bl31_v1.34.elf;name=bl31 \
    https://github.com/rockchip-linux/rkbin/raw/master/bin/rk35/rk3568_bl32_v2.08.bin;name=bl32 \
    https://github.com/rockchip-linux/rkbin/raw/master/bin/rk35/rk3568_ddr_1560MHz_v1.13.bin;name=ddrbin \
    "

SRCREV_source = "26d3b6963ed2d2215348f1baba8b9646ed3dc6ea"
SRC_URI[bl31.sha256sum] = "04de44722d53baf276bbe0c75fff59da70b0581d0f23d8e292eb79f5e2b16eca"
SRC_URI[bl32.sha256sum] = "66bbd173528d12e9739c336926e33ee1ac1f4c7078fcac5712eeb8747d02163e"
SRC_URI[ddrbin.sha256sum] = "53d5e893916e647ccb8c5a2a51f749e9e11bf7329e61a2f94d8c089a333d7812"
LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"

EXTRA_OEMAKE:append:rk3568 = " BL31=${WORKDIR}/rk3568_bl31_v1.34.elf"

DEPENDS += "bc-native dtc-native python3-setuptools-native coreutils-native"

UBOOT_INITIAL_ENV = ""

do_compile:append:rk3568 () {
    oe_runmake BL31=${WORKDIR}/rk3568_bl31_v1.34.elf BL32=${WORKDIR}/rk3568_bl32_v2.08.bin -C ${S} O=${B}/${config} u-boot.itb
    ./tools/mkimage -n rk3568 -T rksd -d ${WORKDIR}/rk3568_ddr_1560MHz_v1.13.bin:spl/u-boot-spl.bin idbloader.img
}
