FROM php:7.4-fpm

# Setting directory for caching
COPY . /app
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

# Installing Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && composer install

# Move nginx conf && enable virtual host config file
RUN mv default /etc/nginx/sites-available/example \
    && ln -s /etc/nginx/sites-available/example /etc/nginx/sites-enabled/

# Set permissions && move index.php
RUN mv index.php /var/www/html \
    && chmod -R 777 /var/www/html

CMD ["./docker_entry.sh"]
