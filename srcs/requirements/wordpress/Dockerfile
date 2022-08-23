FROM debian:buster

RUN	 apt-get update && apt-get install -y wget php php-fpm php-mysql vim

WORKDIR /app


RUN mkdir -p /run/php &&\
	mkdir -p /var/www/wordpress 

COPY ./conf/wp-config.php  /var/www/wordpress 
COPY ./tools/script.sh . 
RUN chmod 744 ./script.sh && chmod 744 /var/www/wordpress/wp-config.php


RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar && \
	mv wp-cli.phar  /usr/bin/wp 

RUN sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 9000|g' /etc/php/7.3/fpm/pool.d/www.conf


EXPOSE 9000


CMD sh script.sh
