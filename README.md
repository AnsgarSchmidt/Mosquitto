Mosquitto
=========
[![Docker Build Statu](https://img.shields.io/docker/build/ansi/mosquitto.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/ansi/mosquitto.svg)]()
[![](https://badge.imagelayers.io/ansi/mosquitto:latest.svg)]()

Docker build file for mosquitto. This docker file is based on
ubuntu 16.04 and mosquitto version 1.4.14

Get it
======
sudo docker pull ansi/mosquitto

Run it
======
sudo docker run -p 1883:1883 --name mosquitto -d ansi/mosquitto
