require recipes-bsp/u-boot/u-boot-common.inc
require recipes-bsp/u-boot/u-boot.inc

DEPENDS += "bc-native dtc-native python3-setuptools-native python3-pyelftools-native"

SRCREV = "020520bbc1ff4a542e014f0873c13b4543aea0ea"
