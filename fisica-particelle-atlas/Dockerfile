FROM rootproject/root-ubuntu16:6.12

MAINTAINER AIRI OpenLab <openlab@airicerca.org>

USER	builder

RUN	sudo apt-get update && sudo apt-get install -y --no-install-recommends wget vim python-pip python-wheel python-setuptools && \
	sudo apt-get clean && \
	sudo rm -rf /var/lib/apt/lists/*

RUN 	sudo -H pip install --upgrade pip wheel jupyter


RUN    	cd $HOME && wget -nv https://github.com/atlas-outreach-data-tools/atlas-outreach-data-tools-framework/archive/master.zip && \
       	unzip master.zip && mv atlas-outreach-data-tools-framework-master atlas-tools-framework && rm master.zip && \
       	mkdir -p atlas-tools-framework/Input/MC && mkdir -p atlas-tools-framework/Input/Data

RUN    	cd $HOME/atlas-tools-framework/Input/MC && wget -nv http://opendata.atlas.cern/release/samples/MC/mc_117049.ttbar_had.root && wget -nv http://opendata.atlas.cern/release/samples/MC/mc_117050.ttbar_lep.root && \
       	cd $HOME/atlas-tools-framework/Input/Data && wget -nv http://opendata.atlas.cern/release/samples/Data/DataMuons.root 

EXPOSE 	8888
WORKDIR $HOME

# Configure container startup
ENTRYPOINT ["/bin/sh", "-c"]
CMD     ["start-notebook.sh"]

# Add local files as late as possible to avoid cache busting
COPY    start.sh /usr/local/bin/
COPY    start-notebook.sh /usr/local/bin/
COPY    start-singleuser.sh /usr/local/bin/
COPY    jupyter_notebook_config.py /etc/jupyter/

