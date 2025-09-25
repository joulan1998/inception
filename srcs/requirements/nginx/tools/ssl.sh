#!/bin/bash

# Create a directory to store the SSL certificates
mkdir -p /etc/nginx/ssl

# Generate a self-signed SSL certificate and private key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MA/ST=Khouribga/L=Khouribga/O=42/OU=42/CN=your_login.42.fr"

# Set permissions
chmod 600 /etc/nginx/ssl/nginx.key