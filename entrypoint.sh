#!/bin/sh
apt update -y && apt upgrade -y && apt-get update -y && apt-get upgrade -y
apt update && apt install -y supervisor wget unzip iproute2
apt-get -y install wget gnupg2
wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
apt-get -y install software-properties-common
add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"
apt-get update
apt-get -y install openresty
/usr/local/openresty/nginx/sbin/nginx -V
service openresty start
apt-get install nginx-module-lua
sed -i "s/aid/$AID/g" /etc/nginx/nginx.conf
nginx -V 2>&1 | grep --color=auto -o with-http_stub_status_module