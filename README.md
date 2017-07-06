Mosquitto
=========

Docker build file for mosquitto. This docker file is based on
ubuntu 16.04 and mosquitto version 1.4.13

Get it
======
sudo docker pull ansi/mosquitto

Run it
======
sudo docker run -p 1883:1883 --name mosquitto -d ansi/mosquitto
