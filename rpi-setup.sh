#!/bin/bash

echo Performing update
apt-get update
apt-get upgrade -y

wget http://ftp.us.debian.org/debian/pool/main/libs/libseccomp/libseccomp2_2.5.1-1_armhf.deb

dpkg -i libseccomp2_2.5.1-1_armhf.deb

echo installing docker

curl -fsSL https://get.docker.com -o get-docker.sh

sh get-docker.sh

usermod -aG docker pi

apt-get install libffi-dev libssl-dev
apt install python3-dev
apt-get install -y python3 python3-pip

sudo pip3 install docker-compose

systemctl enable docker

echo Installing OMV

wget -O - https://raw.githubusercontent.com/OpenMediaVault-Plugin-Developers/installScript/master/install | sudo bash

echo Finished

read -n 1 -s -r -p "Press any key to reboot"

echo Rebooting...
