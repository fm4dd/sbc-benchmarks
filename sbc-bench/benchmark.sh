#!/bin/bash
##########################################################
# benchmark.sh 20170304 Frank4DD
#
# This script runs the following benchmark programs:
# (1) coremark, (2) whetstone, (3) dhrystone, (4) stream
# from ./bin
##########################################################

##########################################################
# Check binaries location
##########################################################
echo
echo "Check for installed binaries:"
echo "-----------------------------"
COREMARK="./bin/coremark"
WHETSTONE="./bin/whetstone"
DHRYSTONE="./bin/dhrystone"
STREAM="./bin/stream"
BINARIES="$COREMARK $WHETSTONE $DHRYSTONE $STREAM"
for BIN in $BINARIES; do
  if [ ! -x $BIN ]; then echo "$BIN not found, exiting."; exit -1;
  else echo -n "Found $BIN, and its executable: "; ls -l $BIN; fi
done
echo "-----------------------------"
echo
##########################################################
# Check results dir location
##########################################################
echo -n "Check the result directory: "
RESULTDIR="./results"
if [ ! -d $RESULTDIR ]; then echo "$RESULTDIR not found, exiting."; exit -1
else echo "OK. Found results directory."; fi
echo "-----------------------------"
echo
##########################################################
# Clear out old results. Careful with the rm -f here...
##########################################################
echo
echo "Cleanup of previous results:"
echo "----------------------------"
rm -f ./results/*
ls -l ./results
echo "-----------------------------"
echo
##########################################################
# Gather the systems HW information
##########################################################
echo "Collect system HW information:"
echo "------------------------------"
echo "cat /proc/cpuinfo > $RESULTDIR/systeminfo.txt"
cat /proc/cpuinfo >> $RESULTDIR/systeminfo.txt
echo "dmesg |egrep 'CPU|VFP|Memory|firmware' >> $RESULTDIR/systeminfo.txt"
dmesg |egrep 'CPU|VFP|Memory|firmware' >> $RESULTDIR/systeminfo.txt
echo "lsb_release -a >> $RESULTDIR/systeminfo.txt"
lsb_release -a >> $RESULTDIR/systeminfo.txt
echo "System HW information completed"
echo "-------------------------------"
echo
##########################################################
# Run the Coremark Benchmark
##########################################################
echo "Run the Coremark Benchmark:"
echo "---------------------------"
echo "$COREMARK > $RESULTDIR/coremark.txt"
$COREMARK > $RESULTDIR/coremark.txt
echo "Coremark Benchmark completed"
echo "-------------------------------"
echo
##########################################################
# Run the Whetstone Benchmark
##########################################################
echo "Run the Whetstone Benchmark:"
echo "----------------------------"
echo "$WHETSTONE 500000 > $RESULTDIR/whetstone.txt"
$WHETSTONE 500000 > $RESULTDIR/whetstone.txt
echo "Whetstone Benchmark completed"
echo "-----------------------------"
echo
##########################################################
# Run the Dhrystone Benchmark
##########################################################
echo "Run the Dhrystone Benchmark:"
echo "----------------------------"
echo "$DHRYSTONE 100000000 > $RESULTDIR/dhrystone.txt"
$DHRYSTONE 100000000 > $RESULTDIR/dhrystone.txt
echo "Dhrystone Benchmark completed"
echo "-----------------------------"
echo
##########################################################
# Run the Stream Benchmark
##########################################################
echo "Run the Stream Benchmark:"
echo "-------------------------"
echo "$STREAM > $RESULTDIR/stream.txt"
$STREAM > $RESULTDIR/stream.txt
echo "Stream Benchmark completed"
echo "--------------------------"
echo
##########################################################
# Run the disk I/O Benchmark. This needs 500 MB space!
##########################################################
echo "Run the disk I/O Benchmark:"
echo "---------------------------"
echo "sync; dd if=/dev/zero of=./diskio.tmp bs=500K count=1024 (Write Speed)" > $RESULTDIR/diskspeed.txt
echo "sync; dd if=/dev/zero of=./diskio.tmp bs=500K count=1024 >> $RESULTDIR/diskspeed.txt 2>&1"
sync; dd if=/dev/zero of=./diskio.tmp bs=500K count=1024 >> $RESULTDIR/diskspeed.txt 2>&1
# we need to set iflag=direct, otherwise dd may read from cache memory
echo "sync; time dd if=./diskio.tmp of=/dev/null iflag=direct bs=500K count=1024 (Read Speed)" >> $RESULTDIR/diskspeed.txt
echo "sync; time dd if=./diskio.tmp of=/dev/null iflag=direct bs=500K count=1024 >> $RESULTDIR/diskspeed.txt 2>&1"
sync; time dd if=./diskio.tmp of=/dev/null iflag=direct bs=500K count=1024 >> $RESULTDIR/diskspeed.txt 2>&1
echo "rm ./diskio.tmp"
rm ./diskio.tmp
echo "Disk I/O Benchmark completed"
echo "----------------------------"
echo

################# END of MAIN #############################
