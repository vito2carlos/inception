#!/bin/bash
if [ ! -f /var/www/html/wp-config.php ]; then

sleep 5
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/database_name_here/$WORDPRESS_DB_NAME/1" wp-config.php
sed -i "s/username_here/$WORDPRESS_DB_USER/1" wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/1" wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/1" wp-config.php
wp core install --allow-root --url=$URL --title=INCEPTION --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL
wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --user_pass=$WORDPRESS_PASSWORD --role=author --allow-root
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

fi


exec "$@"