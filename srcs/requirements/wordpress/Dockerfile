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
