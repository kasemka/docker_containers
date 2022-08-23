sed -i "s|R_DB_NAME|'$DB_NAME'|g" /var/www/wordpress/wp-config.php
sed -i "s|R_DB_USER|'$DB_USER'|g" /var/www/wordpress/wp-config.php
sed -i "s|R_DB_PASSWORD|'$DB_USER_PASSWORD'|g" /var/www/wordpress/wp-config.php
sed -i "s|R_DB_HOST|'$DB_HOST'|g" /var/www/wordpress/wp-config.php


if [ ! -f /var/www/wordpress/index.php ] ; then

wp core download    --allow-root --path="/var/www/wordpress"

wp core install	--allow-root \
				--url=$DOMAIN \
				--title="Inception" \
				--admin_user=$WP_ADMIN_NICK \
				--admin_password=$WP_ADMIN_PASS \
				--admin_email=$WP_ADMIN_MAIL \
				--path="/var/www/wordpress"

wp user create  $WP_USER_NICK $WP_USER_MAIL \
				--role=author \
				--user_pass=$WP_USER_PASS \
				--allow-root \
				--path="/var/www/wordpress"

fi
exec php-fpm7.3 --nodaemonize
