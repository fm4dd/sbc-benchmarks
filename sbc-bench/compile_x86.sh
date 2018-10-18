#!/bin/bash
##########################################################
# compile_x86.sh 20170226 Frank4DD
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
# set appropriate compiler flags
##########################################################
FLAGS="-march=skylake mtune=skylake"

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
if [ "$ARCH" == "aarch64" ]; then
   make PORT_DIR=linux64 clean
   echo "make compile PORT_DIR=linux64 XCFLAGS=$SYSFLAGS"
   make compile PORT_DIR=linux64 XCFLAGS="$SYSFLAGS"
else
   make PORT_DIR=linux clean
   echo "make compile PORT_DIR=linux XCFLAGS=$SYSFLAGS"
   make compile PORT_DIR=linux XCFLAGS="$SYSFLAGS"
fi
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
