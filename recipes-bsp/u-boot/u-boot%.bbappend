#SRC_URI:rock-pi-3a = "git://github.com/radxa/u-boot.git;protocol=https;branch=stable-4.19-rock3"
#SRCREV:rock-pi-3a = "26d3b6963ed2d2215348f1baba8b9646ed3dc6ea"
#LIC_FILES_CHKSUM:rock-pi-3a = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"

do_compile:append:rock2-square () {
	# copy to default search path
	if [ "${SPL_BINARY}" = "u-boot-spl-dtb.bin" ]; then
		cp ${B}/spl/${SPL_BINARY} ${B}
	fi
}

ATF_DEPENDS ??= ""

EXTRA_OEMAKE:append:rk3399 = " BL31=${DEPLOY_DIR_IMAGE}/bl31-rk3399.elf"
ATF_DEPENDS:rk3399 = " trusted-firmware-a:do_deploy"
EXTRA_OEMAKE:append:rk3328 = " BL31=${DEPLOY_DIR_IMAGE}/bl31-rk3328.elf"
ATF_DEPENDS:rk3328 = " trusted-firmware-a:do_deploy"

do_compile[depends] .= "${ATF_DEPENDS}"

