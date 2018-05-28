FROM ubuntu:18.04

ARG  MOSQUITTOVERSION
ENV  MOSQUITTOVERSION 1.5

MAINTAINER Ansgar Schmidt <ansgar.schmidt@gmx.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update     && \
    apt-get upgrade -y && \
    apt-get install -y wget build-essential libwrap0-dev libssl-dev python-distutils-extra \
                       libc-ares-dev uuid-dev && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/

RUN     mkdir -p /usr/local/src
WORKDIR          /usr/local/src
RUN     wget http://mosquitto.org/files/source/mosquitto-$MOSQUITTOVERSION.tar.gz && \
        tar xvzf ./mosquitto-$MOSQUITTOVERSION.tar.gz && \
        rm mosquitto-$MOSQUITTOVERSION.tar.gz && \
        cd mosquitto-$MOSQUITTOVERSION && \
        make && make install && \
        cd .. && rm -rf mosquitto-$MOSQUITTOVERSION

RUN     adduser --system --disabled-password --disabled-login mosquitto
USER    mosquitto

EXPOSE 1883

CMD ["/usr/local/sbin/mosquitto"]
