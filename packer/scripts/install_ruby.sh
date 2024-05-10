#!/bin/sh
killall apt apt-get
rm /var/lib/apt/lists/lock
rm /var/cache/apt/archives/lock
rm /var/lib/dpkg/lock*
dpkg --configure -a
apt update
apt install -y ruby-full ruby-bundler build-essential
apt install -y software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
apt install -y python3.6
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
