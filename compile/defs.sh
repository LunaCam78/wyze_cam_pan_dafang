#!/bin/bash
if [ -n "$BASH_SOURCE" ]; then
    PROG_PATH=${PROG_PATH:-$(readlink -e $BASH_SOURCE)}
else
    PROG_PATH=${PROG_PATH:-$(readlink -e $0)}
fi
PROG_DIR=${PROG_DIR:-$(dirname ${PROG_PATH})}
PROG_NAME=${PROG_NAME:-$(basename ${PROG_PATH})}

DAFANG_DIR=$(readlink -e ${PROG_DIR}/..)
DAFANG_TOOLCHAIN_DIR=${DAFANG_DIR}/toolchain
KERNEL_DIR=${DAFANG_DIR}/kernel-3.10.14
DRIVERS_DIR=${DAFANG_DIR}/driver_source/drivers
DAFANG_NEW_DIR=${DAFANG_DIR}/new
DEPMOD_DIR=${DAFANG_NEW_DIR}/depmod
DEPMOD_MODULES_DIR=${DEPMOD_DIR}/lib/modules/$(uname -r)
BUILT_MODULES_DIR=${DAFANG_NEW_DIR}/modules
BUILT_KERNEL_DIR=${DAFANG_NEW_DIR}/kernel
NEW_KERNEL_FILENAME=kernel-t20.bin

export ARCH=mips
export CROSS_COMPILE=${DAFANG_TOOLCHAIN_DIR}/bin/mips-linux-gnu-
export CC=${CROSS_COMPILE}gcc
export KSRC=$KERNEL_DIR
MAKE_THREADED="make -j$(nproc)"


for v in DAFANG_DIR DAFANG_NEW_DIR DAFANG_TOOLCHAIN_DIR KERNEL_DIR DRIVERS_DIR BUILT_MODULES_DIR DEPMOD_DIR DEPMOD_MODULES_DIR BUILT_KERNEL_DIR NEW_KERNEL_FILENAME
do
    printf '%-32s : %s\n' "$v" "${!v}"
done
ls -l $CC
