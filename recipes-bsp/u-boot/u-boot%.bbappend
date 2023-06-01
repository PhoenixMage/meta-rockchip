do_compile:append:rock2-square () {
	# copy to default search path
	if [ "${SPL_BINARY}" = "u-boot-spl-dtb.bin" ]; then
		cp ${B}/spl/${SPL_BINARY} ${B}
	fi
}

DEPENDS += "python3-pyelftools-native"

ATF_DEPENDS ??= ""

#SRC_URI = "git://gitlab.collabora.com/hardware-enablement/rockchip-3588/u-boot.git;protocol=https;branch=2023.07-rc3-rock5b;lfs=0"

EXTRA_OEMAKE:append:rk3588 = " BL31=${WORKDIR}/bl31-rk3588.elf ROCKCHIP_TPL=${WORKDIR}/ddr-rk3588.bin"
SRC_URI:append:rk3588 = " https://github.com/rockchip-linux/rkbin/raw/78cbbc4f9c36b77a620132ad38d2c6823b4b25fe/bin/rk35/rk3588_bl31_v1.38.elf;sha256sum=51848cc64e12e0fe82a23e43b4628b5b5805b4ec689b260f27fb409d30d3b30b;downloadfilename=bl31-rk3588.elf \
                          https://github.com/rockchip-linux/rkbin/raw/9265fe3409f06e703e36066a5bd37ee163e54471/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin;sha256sum=61a44b0f53451d228cb30c6330f58fcf5b531ad9900e413fa3dc65747211bc1e;downloadfilename=ddr-rk3588.bin"
EXTRA_OEMAKE:append:rk3399 = " BL31=${DEPLOY_DIR_IMAGE}/bl31-rk3399.elf"
ATF_DEPENDS:rk3399 = " trusted-firmware-a:do_deploy"
EXTRA_OEMAKE:append:rk3328 = " BL31=${DEPLOY_DIR_IMAGE}/bl31-rk3328.elf"
ATF_DEPENDS:rk3328 = " trusted-firmware-a:do_deploy"
EXTRA_OEMAKE:append:px30 = " BL31=${DEPLOY_DIR_IMAGE}/bl31-px30.elf"
ATF_DEPENDS:px30 = " trusted-firmware-a:do_deploy"

do_compile[depends] .= "${ATF_DEPENDS}"

