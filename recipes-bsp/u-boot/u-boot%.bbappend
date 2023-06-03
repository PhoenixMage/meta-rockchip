do_compile:append:rock2-square () {
	# copy to default search path
	if [ "${SPL_BINARY}" = "u-boot-spl-dtb.bin" ]; then
		cp ${B}/spl/${SPL_BINARY} ${B}
	fi
}

DEPENDS += "python3-pyelftools-native"

ATF_DEPENDS ??= ""

EXTRA_OEMAKE:append:rk3568 = " BL31=${WORKDIR}/bl31-rk3568.elf ROCKCHIP_TPL=${WORKDIR}/ddr-rk3568.bin"
SRC_URI:append:rk3568 = " https://github.com/rockchip-linux/rkbin/raw/7fac639ad6e3949ddb571cc9646c564d9af2bdeb/bin/rk35/rk3568_bl31_v1.42.elf;sha256sum=b2eabb56105e2b6f6c63a2aa8eca9408263f08fb68cf3f0b27c2419ad21a9963;downloadfilename=bl31-rk3568.elf \
                          https://github.com/rockchip-linux/rkbin/raw/f2f8c7fb4956d81e1a7ad48abea127a1d7633b6e/bin/rk35/rk3568_ddr_1560MHz_v1.16.bin;sha256sum=afb565474cd1dc1e174f2b1bc503a90d31b2990fca572859796e108dec7fc0f8;downloadfilename=ddr-rk3568.bin"
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

