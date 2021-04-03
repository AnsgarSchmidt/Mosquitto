Mosquitto
=========
[![Docker Pulls](https://img.shields.io/docker/pulls/ansi/mosquitto.svg)]()

Docker build file for mosquitto. This docker file is based on
ubuntu 21.04 and mosquitto version 2.0.9

Get it
======
sudo docker pull ansi/mosquitto

Run it
======
sudo docker run -p 1883:1883 --name mosquitto -d ansi/mosquitto
