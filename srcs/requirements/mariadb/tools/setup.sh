#!/bin/bash

service mariadb start

sleep 5

# Create a new user for WordPress and grant privileges
mariadb -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mariadb -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' WITH GRANT OPTION;"
mariadb -e "FLUSH PRIVILEGES;"

# Stop the server
service mariadb stop

# Start the database in foreground
exec /usr/bin/mariadbd-safe