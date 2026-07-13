#!/bin/bash

set -e

echo "Updating packages..."

sudo yum update -y


echo "Installing Apache PHP MySQL client..."

sudo yum install -y \
httpd \
php \
php-mysqlnd \
php-fpm \
php-json \
php-mbstring \
php-gd \
wget \
unzip


echo "Starting Apache..."

sudo systemctl enable httpd
sudo systemctl start httpd


cd /tmp


echo "Downloading WordPress..."

wget https://wordpress.org/latest.zip


unzip latest.zip


sudo rm -rf /var/www/html/*


sudo cp -r wordpress/* /var/www/html/


echo "Setting permissions..."

sudo chown -R apache:apache /var/www/html

sudo chmod -R 755 /var/www/html


echo "WordPress installation completed"
