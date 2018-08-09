FROM ubuntu:18.04 
MAINTAINER AIRI OpenLab <openlab@airicerca.org>

RUN apt-get update && apt-get install -y --no-install-recommends wget python libx11-6 libxext6 libxpm4 && \
    wget -q --no-check-certificate https://root.cern.ch/download/root_v6.14.02.Linux-ubuntu18-x86_64-gcc7.3.tar.gz && \
    tar xzvf root_v6.14.02.Linux-ubuntu18-x86_64-gcc7.3.tar.gz -C /opt && \
    rm -rf root_v6.14.02.Linux-ubuntu18-x86_64-gcc7.3.tar.gz
