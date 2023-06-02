# Add a common override for all Rock 5 machines
MACHINEOVERRIDES =. "rock-5:"

require conf/machine/include/rk3588.inc

MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
