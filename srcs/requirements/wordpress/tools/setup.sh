#!/bin/bash

# Download and install WordPress
wget https://wordpress.org/latest.tar.gz -P /var/www/
tar -xzvf /var/www/latest.tar.gz -C /var/www/
mv /var/www/wordpress /var/www/wordpress

# Create a symbolic link for WordPress to be in the root of the volume
ln -s /var/www/wordpress /var/www/html

# Clean up the downloaded file
rm /var/www/latest.tar.gz

# Navigate to the WordPress directory
cd /var/www/wordpress

# Configure WordPress
wp config create --allow-root --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=mariadb --path='/var/www/wordpress'

# Install WordPress
wp core install --allow-root --url=${DOMAIN_NAME} --title="${WP_TITLE}" --admin_user=${WP_USER} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL}

# Create a second user
wp user create second_user second_user@example.com --allow-root --path='/var/www/wordpress'

# Set permissions
chown -R www-data:www-data /var/www/wordpress
chmod -R 755 /var/www/wordpress