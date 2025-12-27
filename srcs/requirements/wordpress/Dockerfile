# Use PHP 7.4 FPM base image
FROM php:7.4-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    mariadb-client \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install PHP MySQL extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy PHP-FPM configuration
COPY conf/www.conf /usr/local/etc/php-fpm.d/www.conf

# Copy setup script
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

# Set working directory
WORKDIR /var/www/wordpress

# Expose PHP-FPM port
EXPOSE 9000

# Entrypoint: setup WordPress and start PHP-FPM
ENTRYPOINT ["/usr/local/bin/setup.sh"]

# FROM php:7.4-fpm

# # Install dependencies
# RUN apt-get update && apt-get install -y \
#     wget \
#     mariadb-client \
#     mariadb-server \
#     && rm -rf /var/lib/apt/lists/*

# # Install WP-CLI
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/local/bin/wp

# # Copy PHP configuration
# COPY conf/www.conf /usr/local/etc/php-fpm.d/www.conf

# # Copy setup script
# COPY tools/setup.sh /usr/local/bin/setup.sh
# RUN chmod +x /usr/local/bin/setup.sh

# # Set working directory
# WORKDIR /var/www/wordpress

# # Expose PHP-FPM port
# EXPOSE 9000

# # Use an entrypoint script for runtime setup
# ENTRYPOINT ["/usr/local/bin/setup.sh"]
# CMD ["php-fpm"]
# #maybe i will need the 	"Bookworm" because its the ebian 12
# # FROM debian:12
# FROM debian:bullseye

# RUN apt-get update && apt-get install -y \
#     php-fpm \
#     php-mysql \
#     wget \
#     php-cli

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# RUN wp core download --allow-root

# RUN wp config create \
#     --dbname="wordpress" \
#     --dbuser="wordpress_user" \
#     --dbpass="your_db_password" \
#     --dbhost="your_db_root_password" \
#     --allow-root

# RUN wp core install \
#     --url="localhost" \
#     --title="Your WordPress Title" \
#     --admin_user="your_wp_user" \
#     --admin_password="your_wp_password" \
#     --admin_email="ael-your_email@example.com" \
#     --allow-root


# COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

# COPY tools/setup.sh /tmp/setup.sh

# RUN chmod +x /tmp/setup.sh
# RUN /tmp/setup.sh

# WORKDIR /var/www/wordpress

# EXPOSE 9000

# CMD ["php-fpm7.4", "-F"]
# #CMD ["php-fpm7.4"/*, "--daemonize"*/]