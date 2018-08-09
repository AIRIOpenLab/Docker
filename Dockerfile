FROM ubuntu:18.04 
MAINTAINER AIRI OpenLab <openlab@airicerca.org>

RUN apt-get update && apt-get install -y --no-install-recommends wget python3 && \
    wget -q --no-check-certificate https://root.cern.ch/download/root_v6.14.02.Linux-ubuntu18-x86_64-gcc7.3.tar.gz && \
    tar xzvf root_v6.14.02.Linux-ubuntu18-x86_64-gcc7.3.tar.gz
