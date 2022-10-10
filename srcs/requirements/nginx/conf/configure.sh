#!/bin/bash

# Set SSL-certificate
mkdir /etc/nginx/ssl/;

openssl req -x509 -sha256 -nodes -newkey rsa:4096 -days 365 \
        -keyout /etc/nginx/ssl/certificate.key \
        -out /etc/nginx/ssl/certificate.pem \
        -subj "/C=IT/ST=Rome/L=Rome/O=42/CN=tde-nico.42.fr";


# Put configs
mkdir -p /etc/nginx/sites-available/;
mkdir -p /etc/nginx/sites-enabled/;
cp /tmp/nginx.conf /etc/nginx/sites-available/;
rm -f /tmp/nginx.conf;
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf;

