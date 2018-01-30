#!/bin/bash

# j = numero de test, ejecucion actual del test

FILE_PATH=/srv/gluster-test/


BASE_PATH=/root/
FILE_NAME=test_fio
#OUTPUT_FILE=gluster_host_rt30depth64bs
OUTPUT_FILE=gluster_host_depth64bs4rt
#OUTPUT_FILE=hostgluster_${1}_rt30bs4depth


#block sizes 4 8 16 32 64
#ramp_times 10 20 30 40 50 60
#io_depth 1 2 4 8 16 32 64

for i in "10" "20" "30" "40" "50" "60";
do
        TEST="test_rt"
        for j in `seq $1 $2`;
        do
                sync
                # OUTPUT_PATH1=${BASE_PATH}gluster/host/test_bs/
                FIO_TEST_NAME=${FILE_PATH}${FILE_NAME}${i}_${j}

                OUTPUT_PATH=${BASE_PATH}gluster/host/${TEST}/${i}/
                OUTPUT=${OUTPUT_PATH}${OUTPUT_FILE}${i}_${j}

                IOPS_OUTPUT_R=/root/iops/gluster/host/${TEST}/${i}/read/iops_${j}
                IOPS_OUTPUT_W=/root/iops/gluster/host/${TEST}/${i}/write/iops_${j}

                fio --ioengine=libaio --direct=1 --gtod_reduce=1 --name=kubebench --filename=${FIO_TEST_NAME} --bs=4k --size=500M  --readwrite=randrw --rwmixread=70 --ramp_time=${i} --iodepth=64 > ${OUTPUT}

                rm ${FIO_TEST_NAME}

                grep iops ${OUTPUT} | cut -d "=" -f4 | cut -d "," -f1 | head -n 1 > ${IOPS_OUTPUT_R}
                grep iops ${OUTPUT} | cut -d "=" -f4 | cut -d "," -f1 | tail -n 1 > ${IOPS_OUTPUT_W}

                sync
        done
done