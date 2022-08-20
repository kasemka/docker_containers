FROM debian:buster

RUN	 apt-get update && apt-get install -y wget openssl php php-fpm php-mysql

WORKDIR /app

COPY ./conf/wp-config.php .

RUN     wget -P /usr/local/bin https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar &&\
	sudo mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php &&\
	mkdir -p /var/www/wordpress





EXPOSE 9000

CMD 