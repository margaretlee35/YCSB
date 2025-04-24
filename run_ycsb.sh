#!/bin/bash
# run this in a new terminal

YCSB=.
WORKLOAD=./workloads
RUNRESULT=./pim_run_result
OVRPROPERTY=./pim_param.dat

cd $YCSB
rm -rf idx.bt
#for wl in workloada workloadb workloadc workloadd workloade workloadf; do
for wl in workloadc; do
    echo "Running $wl ..."
    
    $YCSB/bin/ycsb load basic -P $WORKLOAD/$wl -P $OVRPROPERTY > $RUNRESULT/load_$wl.txt 2>&1
    $YCSB/bin/ycsb run basic -P $WORKLOAD/$wl -P $OVRPROPERTY > $RUNRESULT/run_$wl.txt 2>&1
done