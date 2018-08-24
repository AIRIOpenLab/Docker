FROM python:2.7-alpine 

LABEL maintainer="AIRI OpenLab <openlab@airicerca.org>"

RUN apk update && apk add wget build-base tini bash

RUN wget https://sourceforge.net/projects/pyquante/files/PyQuante-1.6/PyQuante-1.6.5/PyQuante-1.6.5.tar.gz/download -O PyQuante-1.6.5.tar.gz && \
    tar xzf PyQuante-1.6.5.tar.gz && cd PyQuante-1.6.5 && python setup.py install && rm -rf PyQuante-1.6.5.tar.gz PyQuante-1.6.5/

ENTRYPOINT ["tini", "-g", "--"]

#CMD ["python"]
CMD ["bash"]
