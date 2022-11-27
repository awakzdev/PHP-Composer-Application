FROM php:7.4-fpm

# Setting directory for caching
WORKDIR /app

# Installing dependencies
RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		zip \
		unzip \
		nginx \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd

# Composer Caching
COPY composer.json /app

# Installing Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && composer install

# Setting directory - Install everything below every run regardless of changes
COPY . /app

# Move nginx conf && enable virtual host config file
RUN mv default /etc/nginx/sites-available/example \
    && ln -s /etc/nginx/sites-available/example /etc/nginx/sites-enabled/

# Set permissions && move index.php
RUN mv index.php /var/www/html \
    && chmod -R 777 /var/www/html

# Executable permission for Linux on docker_entry.sh
RUN chmod +x docker_entry.sh

CMD ["./docker_entry.sh"]
