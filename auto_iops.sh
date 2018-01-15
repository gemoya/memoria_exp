#!/bin/bash

#FILE_PATH=/usr/share/nginx/html/


#FILE_NAME=kube_rt30depth64bs

FILE_PATH=/srv/fiotest-host/
FILE_NAME=hostrbd_rt30depth64bs


#OUTPUT_PATH=/root/kube/test/
#OUTPUT_FILE=kube_rt30depth64bs

OUTPUT_PATH=/root/hostrbd/test/
OUTPUT_FILE=hostrbd_rt30depth64bs


RW_MIX=



#block sizes 4 8 16 32 64
#ramp_times 10 20 30 40 50 60
#io_depth 1 2 4 8 16 32 64


for i in "4" "8" "16" "32" "64"; do
	sync
	fio --ioengine=libaio --direct=1 --gtod_reduce=1 --name=kubebench --filename=${FILE_PATH}${FILE_NAME}$i --bs=${i}k --size=500M  --readwrite=randrw --rwmixread=70 --ramp_time=30 --iodepth=64 > ${OUTPUT_PATH}${FILE_NAME}$i
	rm ${FILE_PATH}${FILE_NAME}$i
done
