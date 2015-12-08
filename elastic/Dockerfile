#this images is made of a image ubuntu:14.04
#docker pull ubuntu:14.04
#install elasticsearch2.1 and kibana4.3

FROM ubuntu:14.04
MAINTAINER me

#Default
RUN apt-get update && \
    apt-get -y install net-tools && \
    apt-get -y install sudo && \
    apt-get -y install tar && \  
    apt-get -y install git && \
    apt-get -y install vim && \
    apt-get -y install curl


RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers
#install add-apt-repository
RUN sudo apt-get -y install python-software-properties && \
    sudo apt-get -y install software-properties-common && \
    sudo apt-get update

#Java8
RUN sudo add-apt-repository ppa:webupd8team/java
RUN sudo apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN sudo apt-get -y install oracle-java8-installer

#Elasticsearch 2.1
WORKDIR /tmp
RUN curl -OL https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.1.0/elasticsearch-2.1.0.tar.gz

RUN tar -xvf elasticsearch-2.1.0.tar.gz -C /opt
WORKDIR /opt
RUN sudo useradd  esuser
RUN chown -R esuser elasticsearch-2.1.0
RUN chgrp -R esuser elasticsearch-2.1.0
EXPOSE 9200
EXPOSE 9300

#Kibana 4.3
RUN curl -OL https://download.elastic.co/kibana/kibana/kibana-4.3.0-linux-x64.tar.gz
RUN tar -xvf kibana-4.3.0-linux-x64.tar.gz -C /opt
EXPOSE 5601

ENTRYPOINT /bin/bash

#Do these instrunction below after creating container.
#1.edit ip in /opt/elasticsearch-2.1.0/config/elasticsearch.yml
#  network.host: xxx.xxx.xxx.xxx
#2.start elasticsearch
#  sudo -u esuser /opt/elasticsearch-2.1.0/bin/elasticsearch -d
#3.edit hostname in /opt/kibana-4.3.0-linux-x64/config/kibana.yml
#  elasticsearch.url and server.host
#4.start kibana
#  /opt/kibana-4.3.0-linux-x64/bin/kibana

