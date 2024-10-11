FROM php:8.2-apache

WORKDIR /var/www/html/

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN apt-get update && \
    apt-get install -y \
        libzip-dev
RUN docker-php-ext-install pdo pdo_mysql zip

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY ./composer.* ./

RUN composer update
RUN composer install --prefer-dist --no-dev --no-scripts --no-progress --no-interaction

COPY ./ ./

RUN composer dump-autoload --optimize

EXPOSE 80