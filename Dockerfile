FROM php:8.0.13-fpm-alpine

#COPY ./src/composer.lock ./src/composer.json /var/www/html/

WORKDIR /var/www/html

#RUN docker-php-ext-install mysqli pdo pdo_mysql zip exif pcntl
#RUN docker-php-ext-configure gd --with-freetype --with-jpeg
#RUN docker-php-ext-install gd

RUN apk --update --no-cache add curl

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#RUN chown -R www-data:www-data \
#       /var/www/html/storage \
#       /var/www/html/bootstrap/cache


COPY ./src /var/www/html

EXPOSE 9000
CMD ["php-fpm"]

