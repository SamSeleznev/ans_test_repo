FROM php:7.4-fpm

RUN apt-get update && apt-get install -y nginx && docker-php-ext-install mysqli pdo pdo_mysql

COPY nginx-default.conf /etc/nginx/sites-available/default

WORKDIR /var/www/html

CMD ["sh", "-c", "nginx && php-fpm"]
