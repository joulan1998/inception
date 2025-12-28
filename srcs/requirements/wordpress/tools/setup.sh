#!/bin/bash
set -e

WP_PATH="/var/www/wordpress"

mkdir -p /run/php

if [ ! -f "$WP_PATH/wp-config.php" ]; then
    echo "Installing WordPress..."

    curl -s https://wordpress.org/latest.tar.gz | tar xz -C /var/www
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