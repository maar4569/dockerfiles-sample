#this image is made of a image centos7
#docker pull centos:7
#install nupmy,scipy and matplotlib

FROM centos:7
MAINTAINER me

#Default
RUN yum -y install net-tools sudo tar git
RUN yum -y install gcc gcc-c++ make 
RUN yum -y install freetype
RUN yum -y install python-devel libffi-devel lapack-devel libpng-devel freetype-devel openssl-devel

#python utility
WORKDIR /tmp
RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers
RUN sudo curl -O https://bootstrap.pypa.io/ez_setup.py
RUN python ez_setup.py

#numpy/scipy/matplotlib
RUN easy_install pip
RUN pip install cffi && pip install requests[security]
RUN pip install numpy && pip install scipy && pip install matplotlib

ENTRYPOINT /bin/bash

