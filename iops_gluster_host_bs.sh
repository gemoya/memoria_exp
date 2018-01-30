#!/bin/bash

# $1 = numero de test, ejecucion actual del test

FILE_PATH=/srv/gluster-test/


#FILE_NAME=kube_rt30depth64bs

#FILE_NAME=hostrbd_rt30depth64bs




OUTPUT_PATH1=/root/gluster/host/test_bs/4/
#OUTPUT_PATH2=/root/gluster/host/test_bs/8/
#OUTPUT_PATH3=/root/gluster/host/test_bs/16/
#OUTPUT_PATH4=/root/gluster/host/test_bs/32/
#OUTPUT_PATH5=/root/gluster/host/test_bs/64/
#OUTPUT_PATH2=/root/host/gluster/test_${1}/rt/
#OUTPUT_PATH3=/root/host/gluster/test_${1}/depth/


#mkdir -p ${OUTPUT_PATH1} ${OUTPUT_PATH2} ${OUTPUT_PATH3} ${OUTPUT_PATH4} ${OUTPUT_PATH5}



FILE_NAME=test_fio

#FILE_NAME=gluster_host_testbs_rt30depth64bs
#FILE_NAME2=hostgluster_depth64bs4rt
#FILE_NAME3=hostluster_rt30bs4depth


OUTPUT_FILE=gluster_host_rt30depth64bs
#OUTPUT_FILE2=hostgluster_${1}_depth64bs4rt
#OUTPUT_FILE3=hostgluster_${1}_rt30bs4depth


#block sizes 4 8 16 32 64
#ramp_times 10 20 30 40 50 60
#io_depth 1 2 4 8 16 32 64



sync
fio --ioengine=libaio --direct=1 --gtod_reduce=1 --name=kubebench --filename=${FILE_PATH}${FILE_NAME}4_${1} --bs=4k --size=500M  --readwrite=randrw --rwmixread=70 --ramp_time=30 --iodepth=64 > ${OUTPUT_PATH}${OUTPUT_FILE}4_${1}
rm ${FILE_PATH}${FILE_NAME}4_${1}





#for i in "4" "8" "16" "32" "64"; do
#        sync
#        fio --ioengine=libaio --direct=1 --gtod_reduce=1 --name=kubebench --filename=${FILE_PATH}${FILE_NAME}$i --bs=${i}k --size=500M  --readwrite=randrw --rwmixread=70 --ramp_time=30 --iodepth=64 > ${OUTPUT_PATH}${OUTPUT_FILE}$i
#        rm ${FILE_PATH}${FILE_NAME}$i
#done





#for i in "10" "20" "30" "40" "50" "60"; do
#        sync
#        fio --ioengine=libaio --direct=1 --gtod_reduce=1 --name=kubebench --filename=${FILE_PATH}${FILE_NAME2}$i --bs=4k --size=500M  --readwrite=randrw --rwmixread=70 --ramp_time=$i --iodepth=64 > ${OUTPUT_PATH2}${OUTPUT_FILE2}$i
#        rm ${FILE_PATH}${FILE_NAME2}$i
#done


#for i in "1" "2" "4" "8" "16" "32" "64"; do
#        sync
#        fio --ioengine=libaio --direct=1 --gtod_reduce=1 --name=kubebench --filename=${FILE_PATH}${FILE_NAME3}$i --bs=4k --size=500M  --readwrite=randrw --rwmixread=70 --ramp_time=30 --iodepth=$i > ${OUTPUT_PATH3}${OUTPUT_FILE3}$i
#        rm ${FILE_PATH}${FILE_NAME3}$i
#done

