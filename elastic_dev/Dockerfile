#this images is made of a image elastic:1.0
#elastic:1.0 contains elasticesearch2.1 and kibana4.3
#see a Dockefile
#https://github.com/maar4569/dockerfiles-sample/blob/master/elastic/Dockerfile

FROM elastic:1.0
MAINTAINER me


#configure
#elasticesearch.url and server.host in kibana.yml
#network.host and cluster.name in elasticsearch.yml

ENTRYPOINT IP=`/sbin/ifconfig eth0 | grep "inet addr" | awk '{print $2}' | sed 's/addr://' ` && \
  sed -i -e "s/\# elasticsearch.url\: \"http\:\/\/localhost\:9200\"/elasticsearch.url\: \"http:\/\/$IP\:9200\"/g" /opt/kibana-4.3.0-linux-x64/config/kibana.yml && \
  sed -i -e "s/\# server.host\: \"0.0.0.0\"/server.host\: \"$IP\"/g" /opt/kibana-4.3.0-linux-x64/config/kibana.yml && \
  sed -i -e "s/\# network.host\: 192.168.0.1/network.host\: $IP/g" /opt/elasticsearch-2.1.0/config/elasticsearch.yml && \
  sed -i -e "s/\# cluster.name\: my-application/cluster.name\: mycluster/g" /opt/elasticsearch-2.1.0/config/elasticsearch.yml && \
 sudo -u esuser /opt/elasticsearch-2.1.0/bin/elasticsearch -d && \
  /bin/bash


