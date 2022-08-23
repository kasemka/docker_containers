FROM		debian:buster

RUN			apt-get update 	&&  apt-get -y install nginx openssl

COPY		./conf/nginx.conf /etc/nginx/sites-available/nginx.conf

ARG 		DOMAIN
RUN 		ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/mysite.conf &&\
	rm -rf /etc/nginx/sites-enabled/default 

RUN			sed -i "s|domain|$DOMAIN|g" /etc/nginx/sites-available/nginx.conf 

RUN			openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/private.key -out /etc/ssl/certs/public.crt \
	-subj "/C=RU/ST=TATARSTAN/L=KAZAN/O=21SCHOOL/OU=IT/CN=$DOMAIN" 

RUN			chown -R www-data /var/www/* && chmod -R 744 /var/www/*

CMD			nginx "-g" "daemon off;"

