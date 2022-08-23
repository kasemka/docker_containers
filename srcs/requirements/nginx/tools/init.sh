# #!/bin/bash

# ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf;
# rm /etc/nginx/sites-enabled/default;

# sed -i -e "s/\${DOMAIN}/${DOMAIN}/g" /etc/nginx/sites-available/nginx.conf;

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -keyout /etc/ssl/private/private.key \
#     -out /etc/ssl/certs/public.crt \
#     -subj "/C=RU/ST=TATARSTAN/L=KAZAN/O=21SCHOOL/OU=IT/CN=domain.com";

# # chmod 400 etc/ssl/private/ft_inception.key;
# # chmod 400 etc/ssl/certs/ft_inception.crt;
# chown -R www-data /var/www/*
# chmod -R 744 /var/www/*
# nginx "-g" "daemon off;";



#               copy config
# if [ ! -f /tmp/ng_link ]; then
    ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/mysite.conf 
    rm -rf /etc/nginx/sites-enabled/default
    # touch /tmp/ng_link
# fi
# 
#               create keys and certs
# if [ ! -d /etc/nginx/ssl ]; then
    mkdir /etc/nginx/ssl
    openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/private.pem -keyout /etc/nginx/ssl/public.key -subj "/C=RU/L=KAZAN/OU=21school/"
    openssl rsa -noout -text -in /etc/nginx/ssl/public.key 
# fi
# 
#               giving permissions
# if [ ! -f /tmp/perm ]; then
    chown -R www-data /var/www/*
    chmod -R 744 /var/www/*
    # touch /tmp/perm
# fi