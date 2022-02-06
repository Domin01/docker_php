FROM debian
MAINTAINER Alejandro Domínguez Alcocer "alejandroomin@gmail.com"

ADD bookmedik /var/www/html/
ADD docker-entrypoint.sh /usr/local/bin/


RUN apt-get update && apt-get install -y apache2 libapache2-mod-php php-mysql mariadb-client && apt clean && rm -rf /var/lib/apt/lists/* && chmod u+x /usr/local/bin/docker-entrypoint.sh


ENV DATABASE_USER user_book
ENV DATABASE_PASSWORD root
ENV DATABASE_HOST bd

EXPOSE 80
ENTRYPOINT ["docker-entrypoint.sh"]




