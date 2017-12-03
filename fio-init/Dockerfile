FROM ubuntu:16.04
MAINTAINER Gonzalo Moya <gemoya@inf.utfsm.cl>

RUN apt-get update && apt-get install -y fio wget vim jq curl

VOLUME /fiotest
ENV HOME /fiotest
WORKDIR /fiotest

RUN echo "fio --ioengine=libaio --direct=1 --gtod_reduce=1 --name=kubebench --filename=kubebench_n --bs=4k --iodepth=64 --size=500M --readwrite=randrw --rwmixread=70 --ramp_time=4 --output-format=json" > /fiotest.sh
#CMD ["fio","--ioengine=libaio","--direct=1","--gtod_reduce=1","--name=kubebench","--filename=kubebench_n","--bs=4k","--iodepth=64","--size=500M","--readwrite=randrw","--rwmixread=70","--ramp_time=4","--output-format=json"]
ENTRYPOINT ["/sbin/init"]
