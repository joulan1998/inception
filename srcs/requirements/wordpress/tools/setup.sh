#!/bin/bash
set -e

# WP_PATH="/var/www/html"
WP_PATH="/var/www/wordpress"

mkdir -p /run/php

if [ ! -f "$WP_PATH/wp-config.php" ]; then
    echo "Installing WordPress..."

    curl -s https://wordpress.org/latest.tar.gz | tar xz -C /var/www
    # mv -r /var/www/wordpress/* "$WP_PATH"
    # rm -rf /var/www/wordpress
    cp -a /var/www/wordpress/. /var/www/html/
    chown -R www-data:www-data /var/www/html

    wp config create \
        --allow-root \
        --path="$WP_PATH" \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASSWORD" \
        --dbhost=mariadb

    wp core install \
        --allow-root \
        --path="$WP_PATH" \
        --url="$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_USER" \
        --admin_password="$WP_PASSWORD" \
        --admin_email="$WP_EMAIL"

    chown -R www-data:www-data "$WP_PATH"
fi

exec php-fpm

# #!/bin/bash

# # Download and install WordPress
# wget https://wordpress.org/latest.tar.gz -P /var/www/
# # tar -xzvf /var/www/latest.tar.gz -C /var/www/
# tar -xzvf /var/www/latest.tar.gz --directory /var/www/
# cp -f  /var/www/wordpress /var/www/wordpress
# # mv -f /var/www/wordpress /var/www/wordpress

# # Create a symbolic link for WordPress to be in the root of the volume
# ln -s /var/www/wordpress /var/www/html

# # Clean up the downloaded file
# rm /var/www/latest.tar.gz

# # Navigate to the WordPress directory
# cd /var/www/wordpress

# # Configure WordPress
# wp config create --allow-root --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=mariadb --path='/var/www/wordpress'

# # Install WordPress
# wp core install --allow-root --url=${DOMAIN_NAME} --title="${WP_TITLE}" --admin_user=${WP_USER} --admin_password=${WP_PASSWORD} --admin_email=${WP_EMAIL}

# # Create a second user
# wp user create second_user second_user@example.com --allow-root --path='/var/www/wordpress'

# # Set permissions
# chown -R www-data:www-data /var/www/wordpress
# chmod -R 755 /var/www/wordpress
# mkdir -p /run/php #its mine for docker logs word