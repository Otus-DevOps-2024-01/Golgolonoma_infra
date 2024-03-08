#!/bin/sh
apt-get update
sleep 10
systemctl stop unnatended-upgrades.service
apt-get install -y ruby-full ruby-bundler build-essential
