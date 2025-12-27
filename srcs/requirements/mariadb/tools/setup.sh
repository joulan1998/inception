#!/bin/bash

service mariadb start

sleep 5

# Create a new user for WordPress and grant privileges
mariadb -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mariadb -e "CREATE USER IF NOT EXISTS ${DB_USER}@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' WITH GRANT OPTION;"
mariadb -e "FLUSH PRIVILEGES;"

# Stop the server
# service mariadb start
service mariadb stop

# Start the database in foreground
# exec /usr/bin/mariadbd-safe
mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'