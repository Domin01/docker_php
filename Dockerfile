FROM php:7.4-apache-bullseye
MAINTAINER Alejandro Domínguez Alcocer "alejandroomin@gmail.com"

ADD bookmedik /var/www/html/
ADD docker-entrypoint.sh /usr/local/bin/


RUN apt update && apt upgrade && docker-php-ext-install mysqli pdo pdo_mysql && apt install -y mariadb-client && apt clean && rm -rf /var/lib/apt/lists/* && chmod u+x /usr/local/bin/docker-entrypoint.sh


ENV DATABASE_USER user_book
ENV DATABASE_PASSWORD root
ENV DATABASE_HOST bd

EXPOSE 80
ENTRYPOINT ["docker-entrypoint.sh"]




