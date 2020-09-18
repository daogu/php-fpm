FROM php:fpm

RUN \
    apt-get update \
    && apt-get install -y \
    zlib1g-dev \
    libpng-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-source delete \
    && apt-get clean \
    && rm -rf /var/lib/apt/list/*