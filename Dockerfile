FROM rootproject/root-ubuntu16:6.12

MAINTAINER AIRI OpenLab <openlab@airicerca.org>

RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends wget 
RUN    cd $HOME && wget https://github.com/atlas-outreach-data-tools/atlas-outreach-data-tools-framework/archive/master.zip && \
       unzip master.zip && mv atlas-outreach-data-tools-framework-master atlas-tools-framework && rm master.zip && \
       && mkdir -p atlas-tools-framework/Input/MC && mkdir -p atlas-tools-framework/Input/Data && \
       cd $HOME/atlas-tools-framework/Input/MC && wget http://opendata.atlas.cern/release/samples/MC/mc_117049.ttbar_had.root && wget http://opendata.atlas.cern/release/samples/MC/mc_117050.ttbar_lep.root && \
       cd $HOME/atlas-tools-framework/Input/Data && wget http://opendata.atlas.cern/release/samples/Data/DataMuons.root 


CMD ["/bin/bash"]
