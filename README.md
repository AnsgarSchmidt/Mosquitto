Mosquitto
=========

Docker build file for mosquitto. This docker file is based on
ubuntu 14.4 and mosquitto version 1.3.

Get it
======
sudo docker pull ansi/mosquitto

Run it
======
sudo docker run -p 1833:1833 --name mosquitto -d ansi/mosquitto
