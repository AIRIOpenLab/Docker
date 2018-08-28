FROM rootproject/root-ubuntu16:6.12

LABEL maintainer="AIRI OpenLab <openlab@airicerca.org>"

USER	builder

RUN	sudo apt-get update && sudo apt-get install -y --no-install-recommends wget vim python-pip python-wheel python-setuptools && \
	sudo apt-get clean && \
	sudo rm -rf /var/lib/apt/lists/*

RUN 	sudo -H pip install --upgrade pip wheel jupyter

ADD     https://github.com/atlas-outreach-data-tools/atlas-outreach-data-tools-framework/archive/master.zip /tmp/master.zip 

RUN    	unzip /tmp/master.zip -d /tmp && sudo mv /tmp/atlas-outreach-data-tools-framework-master /usr/lib/python2.7/atlas_tools && sudo rm /tmp/master.zip && \
       	sudo mkdir -p /usr/lib/python2.7/atlas_tools/Input/MC && sudo mkdir -p /usr/lib/python2.7/atlas_tools/Input/Data

ADD     http://opendata.atlas.cern/release/samples/MC/mc_117049.ttbar_had.root /usr/lib/python2.7/atlas_tools/Input/MC/mc_117049.ttbar_had.root
ADD     http://opendata.atlas.cern/release/samples/MC/mc_117050.ttbar_lep.root /usr/lib/python2.7/atlas_tools/Input/MC/mc_117049.ttbar_lep.root
ADD     http://opendata.atlas.cern/release/samples/Data/DataMuons.root /usr/lib/python2.7/atlas_tools/Input/Data/DataMuons.root 

RUN     for i in $(find /usr/lib/python2.7/atlas_tools -type d); do sudo touch $i/__init__.py; done 

EXPOSE 	8888
WORKDIR $HOME

# Add Tini 
ENV TINI_VERSION v0.18.0 
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini 
RUN sudo chmod +x /bin/tini 

# Configure container startup
ENTRYPOINT ["/bin/tini", "-g", "--"]
CMD     ["start-notebook.sh"]

# Add local files as late as possible to avoid cache busting
COPY    start.sh /usr/local/bin/
COPY    start-notebook.sh /usr/local/bin/
COPY    start-singleuser.sh /usr/local/bin/
COPY    jupyter_notebook_config.py /etc/jupyter/

