#!/bin/bash

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then

	ls | grep -v start.sh | xargs rm -rf

	export WP_CLI_CACHE_DIR=/var/www/wordpress/.wp-cli/cache

	wp core download
	wp core config --dbname=$WP_DB_NAME --dbuser=$WP_DB_USR --dbpass=$WP_DB_PWD --dbhost=$MYSQL_HOST --dbprefix='wp_' --dbcharset="utf8" --dbcollate="utf8_general_ci"
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email
	wp user create $WP_USR $WP_EMAIL --user_pass=$WP_PWD --role=subscriber
fi


/usr/sbin/php-fpm7.3 --nodaemonize
