FROM ubuntu:18.04

ARG  MOSQUITTOVERSION
ENV  MOSQUITTOVERSION 1.5.1

MAINTAINER Ansgar Schmidt <ansgar.schmidt@gmx.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update     && \
    apt-get upgrade -y && \
    apt-get install -y wget build-essential libwrap0-dev libssl-dev python-distutils-extra \
                       libc-ares-dev uuid-dev unzip cmake

RUN     mkdir -p /usr/local/src
WORKDIR          /usr/local/src
RUN     wget https://github.com/warmcat/libwebsockets/archive/v3.0.1.zip && \
        unzip v3.0.1.zip && \
        cd libwebsockets-3.0.1 && \
        mkdir build && \
        cd build && \
        cmake .. && \
        make && \
        make install
RUN     wget http://mosquitto.org/files/source/mosquitto-$MOSQUITTOVERSION.tar.gz
RUN     tar xvzf ./mosquitto-$MOSQUITTOVERSION.tar.gz
WORKDIR /usr/local/src/mosquitto-$MOSQUITTOVERSION
RUN     sed -i -e 's/WITH_WEBSOCKETS:=no/WITH_WEBSOCKETS:=yes/g' config.mk && make && make install
RUN     ldconfig 

RUN     adduser --system --disabled-password --disabled-login mosquitto
USER    mosquitto

EXPOSE 1883

CMD ["/usr/local/sbin/mosquitto"]
