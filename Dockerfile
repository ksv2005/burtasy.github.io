FROM php:5.6-apache

RUN sed -i -e 's/deb.debian.org/archive.debian.org/g' \
           -e 's|security.debian.org|archive.debian.org/|g' \
           -e '/stretch-updates/d' /etc/apt/sources.list

ENV TZ="Europe/Moscow"

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
              libfreetype6-dev \
              libmagickwand-dev --no-install-recommends \
              libicu-dev zlib1g-dev libpng-dev libzip-dev zip unzip git curl mc \
      && docker-php-ext-configure intl \
      && docker-php-ext-install intl pdo pdo_mysql mysql mysqli zip

# Apache modules
RUN a2enmod rewrite

CMD ["apache2-foreground"]
