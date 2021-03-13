FROM php:7.4-fpm

WORKDIR /var/www/html

# install dependencies
RUN apt-get update \
  && apt-get install --yes --quiet --no-install-recommends \
    libzip-dev \
    unzip \
    curl 

# clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# install extentions
RUN docker-php-ext-install zip pdo pdo_mysql \
  && pecl install -o -f redis-5.1.1 \
  && docker-php-ext-enable redis

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN groupadd --gid 1000 appuser \
  && useradd --uid 1000 -g appuser \
  -G www-data,root --shell /bin/bash \
  --create-home appuser

USER appuser