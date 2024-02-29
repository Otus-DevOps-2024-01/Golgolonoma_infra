##!/bin/bash
## Update the package listing
#sudo apt-get update
## Install packages to allow apt to use a repository over HTTPS:
#sudo apt-get install -y apt-transport-https ca-certificates gnupg
#
## Import the MongoDB public GPG Key:
#sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
#
## Add the MongoDB repository6
#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
#
#sudo apt-get update
#sudo apt-get install -y mongodb-org
#sudo service systemd-logind start
#sudo apt install -y dbus
#sudo systemctl start dbus
#sudo systemctl daemon-reload
#sudo systemctl enable mongod.service
#systemctl start mongod.service
#systemctl status mongod.service
#sudo systemctl --type=service --state=active | grep mongod


#!/bin/bash

# Update the package listing
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install -y apt-transport-https ca-certificates gnupg

# Import the MongoDB public GPG Key:
sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -

# Add the MongoDB repository
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

# Update the package listing again after adding the new repository
sudo apt-get update

# Install MongoDB packages
sudo apt-get install -y mongodb-org

# MongoDB requires a data directory and log directory
sudo mkdir -p /data/db /var/log/mongodb
sudo chown -R mongodb:mongodb /data/db /var/log/mongodb

# Start MongoDB directly (without systemd)
sudo -u mongodb mongod --dbpath /data/db --logpath /var/log/mongodb/mongod.log --fork

# Optional: Show that MongoDB is running by listing the MongoDB process
ps aux | grep mongod
