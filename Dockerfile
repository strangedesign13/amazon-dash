FROM   ubuntu:latest
MAINTAINER	Chris Strange <chris@strangedesign.net>

#Install Pre-reqs
RUN \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y sudo && \
    apt-get install -y git && \
    apt-get install -y python && \
    apt-get install -y python-setuptools && \
    apt-get install -y python-dev && \
    apt-get install -y build-essential && \
    apt-get install -y python-pip $$ \

#install amazon-dash
RUN cd /root && export GIT_SSL_NO_VERIFY=1 && \
    git config --global http.sslVerify false && \
    git clone https://github.com/Nekmo/amazon-dash

WORKDIR /root/amazon-dash
RUN cd /root/amazon-dash && python setup.py install
ADD amazon-dash.yaml /root/amazon-dash/amazon-dash.yaml

# Interface the environment
VOLUME /root/dasher/config

# Init Process To Start Amazon-Dash
CMD cd /root/amazon-dash && sudo amazon-dash run
