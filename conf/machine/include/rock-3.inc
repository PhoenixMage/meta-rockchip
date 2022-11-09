# Add a common override for all Rock Pi 4 machines
MACHINEOVERRIDES =. "rock-pi-3:"

require conf/machine/include/rk3568.inc

MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
