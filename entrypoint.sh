#!/bin/sh
apt update -y && apt upgrade -y && apt-get update -y && apt-get upgrade -y
apt update && apt install -y supervisor wget unzip iproute2
apt-get -y install wget gnupg2
apt-get install nginx-plus-module-ndk
apt-get install nginx-plus-module-lua
nginx -t && nginx -s reload