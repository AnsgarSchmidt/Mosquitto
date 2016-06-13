FROM ubuntu:16.04

MAINTAINER Ansgar Schmidt <ansgar.schmidt@gmx.net>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
  build-essential \
  libc-ares-dev \
  libssl-dev \
  libwrap0-dev \
  python-distutils-extra \
  uuid-dev \
  wget \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src
RUN wget http://mosquitto.org/files/source/mosquitto-1.4.9.tar.gz && tar -xzvf ./mosquitto-1.4.9.tar.gz

WORKDIR /usr/local/src/mosquitto-1.4.9
RUN make && make install && /sbin/ldconfig
RUN adduser --system --disabled-password --disabled-login mosquitto

USER mosquitto
EXPOSE 1883
CMD ["/usr/local/sbin/mosquitto"]
