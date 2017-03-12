#!/bin/bash
##########################################################
# compile.sh 20170226 Frank4DD
#
# This script generates the following benchmark programs:
# (1) coremark, (2) whetstone, (3) dhrystone, (4) stream
# into ./bin
##########################################################
# set debug: 0=off 1=normal  2=verbose
DEBUG=0

##########################################################
# Clear out old binaries. Careful with the rm -f here...
##########################################################
echo
echo "Cleanup of previous binaries:"
echo "-----------------------------"
rm -f ./bin/*
ls -l ./bin
echo "-----------------------------"
echo
##########################################################
# Identify platform and set appropriate compiler flags
##########################################################
RASPI1FLAGS="-mcpu=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp"
RASPI2FLAGS="-mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4"
RASPI3FLAGS="-mcpu=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits"
CYCLV5FLAGS="-mcpu=cortex-a9 -mfloat-abi=hard -mfpu=neon"
BBONEBFLAGS="-mcpu=cortex-a8 -mfloat-abi=hard -mfpu=neon"

echo "Identify platform and model #:"
echo "-----------------------------"
CPUHW=`cat /proc/cpuinfo | grep 'Hardware' | cut -d ":" -f 2-`
REVID=`cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/^1000//'`

echo -n "CPUHW is $CPUHW and Revision $REVID, "

case "$CPUHW" in 
  *BCM270*)
    echo "We found a Raspberry Pi."
    RASPI1=(0002 0003 0004 0005 0006 0007 0008 0009 000d 000e 000f)
    RASPI2=(a01040 a01041 a21041)
    RASPI3=(a02082 a020a0 a22082 a32082)
    case "${RASPI1[@]}" in *"$REVID"*) echo "It's a Raspberry Pi with ARMv6 CPU"; SYSFLAGS="$RASPI1FLAGS" ;; esac
    case "${RASPI2[@]}" in *"$REVID"*) echo "It's a Raspberry Pi with ARMv7 CPU"; SYSFLAGS="$RASPI2FLAGS" ;; esac
    case "${RASPI3[@]}" in *"$REVID"*) echo "It's a Raspberry Pi with ARMv8 CPU"; SYSFLAGS="$RASPI3FLAGS" ;; esac
    if [ -z ${SYSFLAGS+x} ]; then echo "We found a unknown Raspberry Pi (Revision: $REVID), exiting."; exit; fi
    ;;
  *AM33XX*)
    echo "We found a BeagleBone Black."
    SYSFLAGS="$BBONEBFLAGS"
    ;;
  *SOCFPGA*)
    echo "We found a Altera SoC FPGA."
    SYSFLAGS="$CYCLV5FLAGS"
    ;;
  *)
    echo "We found a unknown board, exiting."
    exit
    ;;
esac
echo "Compiler options will be set to '$SYSFLAGS'"
echo

##########################################################
# Compile the Coremark Benchmark
##########################################################
echo "Compile the Coremark Benchmark:"
echo "-------------------------------"
SRCDIR="src/coremark"
cd $SRCDIR
echo "run make clean before build:"
unset XCFLAGS
unset PORT_DIR
make PORT_DIR=linux clean
echo "make compile PORT_DIR=linux XCFLAGS=$SYSFLAGS"
make compile PORT_DIR=linux XCFLAGS="$SYSFLAGS"
ls -l coremark
cp coremark ../../bin
cd ../../
echo "Coremark Benchmark created"
echo "-------------------------------"
echo
##########################################################
# Compile the Whetstone Benchmark
##########################################################
echo "Compile the Whetstone Benchmark:"
echo "-------------------------------"
SRCDIR="src/whetstone"
cd $SRCDIR
if [ -x ./whetstone ]; then echo "Deleting old whetstone"; rm whetstone; fi
echo gcc whetstone.c -o whetstone -O3 $SYSFLAGS -lm -fopenmp -static
gcc whetstone.c -o whetstone -O3 $SYSFLAGS -lm -fopenmp -static
ls -l whetstone
cp whetstone ../../bin
cd ../../
echo "Whetstone Benchmark created"
echo "-------------------------------"
echo
##########################################################
# Compile the Dhrystone Benchmark
##########################################################
echo "Compile the Dhrystone Benchmark:"
echo "-------------------------------"
SRCDIR="src/dhrystone"
cd $SRCDIR
if [ -x ./dhrystone ]; then echo "Deleting old dhrystone."; rm dhrystone; fi
echo gcc -DTIME dhry_1.c dhry_2.c -o dhrystone -O2 $SYSFLAGS -fopenmp -static
gcc -DTIME dhry_1.c dhry_2.c -o dhrystone -O2 $SYSFLAGS -fopenmp -static
ls -l dhrystone
cp dhrystone ../../bin
cd ../../
echo "Dhrystone Benchmark created"
echo "-------------------------------"
echo
##########################################################
# Compile the Stream Benchmark
##########################################################
echo "Compile the Stream Benchmark:"
echo "-----------------------------"
SRCDIR="src/stream"
cd $SRCDIR
if [ -x ./stream ]; then echo "Deleting old stream."; rm stream; fi
echo gcc stream.c -o stream -Ofast $SYSFLAGS -fopenmp -static
gcc stream.c -o stream -Ofast $SYSFLAGS -fopenmp -static
ls -l stream
cp stream ../../bin
cd ../../
echo "Stream Benchmark created"
echo "------------------------"
echo
##########################################################
# Check and strip the final binaries
##########################################################
echo
echo "Show all benchmark binaries:"
echo "----------------------------"
ls -l ./bin
echo "Stripping benchmark binaries."
strip ./bin/*
echo "Show all benchmark binaries:"
ls -l ./bin
echo "-----------------------------"
echo
################# END of MAIN #############################
