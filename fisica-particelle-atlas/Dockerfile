FROM rootproject/root-ubuntu16:6.12

LABEL maintainer="AIRI OpenLab <openlab@airicerca.org>"

USER 	builder
WORKDIR /home/builder
EXPOSE  8888


ENV 	DEBIAN_FRONTEND=noninteractive \
        NB_UID=14806 \
        NB_GID=14806 \
        NB_USER=builder
# python-tk
RUN	sudo apt-get update && sudo apt-get install -yq --no-install-recommends wget vim python-pip python-wheel python-setuptools && \
	sudo apt-get clean && \
	sudo rm -rf /var/lib/apt/lists/*

RUN 	sudo -H pip install --no-cache-dir --upgrade pip wheel jupyter 
# matplotlib

ADD     https://github.com/AIRIOpenLab/atlas-outreach-data-tools-framework/archive/master.zip /tmp/master.zip 
#ADD     http://opendata.atlas.cern/release/samples/complete_set_of_ATLAS_open_data_samples_July_2016.zip /tmp/alldata.zip

RUN    	sudo unzip /tmp/master.zip -d /tmp && sudo mv /tmp/atlas-outreach-data-tools-framework-master /usr/lib/python2.7/atlas_tools && sudo rm /tmp/master.zip && \
       	sudo mkdir -p /opendata/MC && sudo mkdir -p /opendata/Data && \
        for i in $(find /usr/lib/python2.7/atlas_tools -type d); do sudo touch $i/__init__.py; done

ADD     http://opendata.atlas.cern/release/samples/MC/mc_147770.Zee.root /opendata/MC/mc_147770.Zee.root
ADD     http://opendata.atlas.cern/release/samples/Data/DataEgamma.root /opendata/Data/DataEgamma.root

# Add Tini 
ENV	TINI_VERSION v0.18.0
ADD 	https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN 	sudo chmod +x /bin/tini

# Configure container startup
ENTRYPOINT ["/bin/tini", "-g", "--"]
CMD     ["/usr/local/bin/start-notebook.sh"]

# Add local files as late as possible to avoid cache busting
COPY    start.sh /usr/local/bin/
COPY    start-notebook.sh /usr/local/bin/
COPY    start-singleuser.sh /usr/local/bin/
COPY    jupyter_notebook_config.py /etc/jupyter/

RUN     sudo chmod +x /usr/local/bin/start.sh /usr/local/bin/start-notebook.sh /usr/local/bin/start-singleuser.sh
