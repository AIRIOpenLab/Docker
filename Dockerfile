FROM rootproject/root-ubuntu16:latest
MAINTAINER AIRI OpenLab <openlab@airicerca.org>

RUN apt-get update && apt-get install -y --no-install-recommends wget python && \
    wget -q --no-check-certificate https://github.com/atlas-outreach-data-tools/atlas-outreach-data-tools-framework/archive/master.zip && \
    unzip master.zip && \
    mv atlas-outreach-data-tools-framework-master atlas-tools-framework && \
    rm master.zip
