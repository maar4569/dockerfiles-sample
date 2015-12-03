#this images is made of a image centos7
#docker pull centos:7
#install ruby(2.2.3) from source code , and so on.

FROM centos:7
MAINTAINER me

#Default
#RUN yum -y update
RUN yum -y install net-tools && \
    yum -y install sudo && \
    yum -y install tar && \  
    yum -y install git

#Ruby
#to build ruby
RUN yum -y install gcc && \
    yum -y install make && \
    yum -y install gcc-c++

#build from source
WORKDIR /tmp
RUN curl -OL https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz
RUN tar zxvf ruby-2.2.3.tar.gz
WORKDIR ruby-2.2.3

RUN sed -i -e "s/Defaults    requiretty.*/ #Defaults    requiretty/g" /etc/sudoers
RUN ./configure && sudo make && sudo make install
RUN ruby -v 

#Ruby for zaimapp
#base
RUN yum -y install ruby-devel && \
    yum -y install libxslt-devel.x86_64 && \
    yum -y install patch.x86_64 && \
    yum -y install zlib zlib-devel && \
#for rails
    yum -y install openssl-devel

#install ruby gems
WORKDIR /tmp
RUN git clone https://github.com/rubygems/rubygems.git
WORKDIR rubygems
RUN ruby setup.rb && gem -v

#build zlib for rails
WORKDIR /tmp/ruby-2.2.3/ext/zlib
RUN ruby extconf.rb && make && make install

#build openssl for rails
WORKDIR /tmp/ruby-2.2.3/ext/openssl
RUN ruby extconf.rb
RUN cp Makefile Makefile_bak
RUN sed -i -e "1i top_srcdir=$(cd ../.. && pwd)" Makefile
RUN make && make install

#for zaimapp
RUN gem install rails && \
    gem install mail  && \
    gem install mechanize && \
    gem install nokogiri && \
    gem install rspec

#omniauth-zaimv2
WORKDIR /tmp
RUN git clone https://github.com/maar4569/omniauth-zaimv2.git
WORKDIR omniauth-zaimv2
RUN gem build omniauth-zaimv2.gemspec && \
    gem install omniauth-zaimv2.gem

ENTRYPOINT /bin/bash

