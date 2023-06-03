# Add a common override for all Rock 5 machines
MACHINEOVERRIDES =. "rock-3:"

require conf/machine/include/rk3568.inc

MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
