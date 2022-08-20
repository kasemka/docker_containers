FROM debian:buster

RUN	 apt-get update && apt-get install -y nginx openssl

WORKDIR /app

COPY /conf/nginx.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf && \
	rm -rf /etc/nginx/sites-enabled/default

ARG DOMAIN
RUN	mkdir -p /etc/nginx/certs

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/my_private.key \
	-out /etc/nginx/certs/crt_public.crt \
	-subj "/C=RU/ST=TATARSTAN/L=KAZAN/O=Inception Inc/OU=IT/CN=${DOMAIN}";


EXPOSE 443


ENTRYPOINT	nginx -g "daemon off;"
# "/C=US/ST=Utah/L=Lehi/O=Your Company, Inc./OU=IT/CN=yourdomain.com"