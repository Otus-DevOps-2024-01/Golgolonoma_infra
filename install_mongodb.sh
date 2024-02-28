#!/bin/bash
# Update the package listing
sudo apt-get update
# Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install -y apt-transport-https ca-certificates gnupg

# Import the MongoDB public GPG Key:
sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -

# Add the MongoDB repository
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

# Update the package listing again, now with the new repository added
sudo apt-get update

# Install MongoDB packages
sudo apt-get install -y mongodb-org

# Start MongoDB and enable it to start on boot2
sudo systemctl start mongod
sudo systemctl enable mongod
