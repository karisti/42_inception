#!/bin/bash

# Create Database && Securing database engine installation
if [ ! -d "/var/lib/mysql/${WP_DB_NAME}" ]; then
	mysql_install_db --user=mysql --datadir="/var/lib/mysql" > /dev/null
	chown -R mysql:mysql /var/lib/mysql

	service mysql start

	mysql --user=root --password="" <<_EOF_
	CREATE DATABASE ${WP_DB_NAME};
	USE ${WP_DB_NAME};
	GRANT ALL ON *.* TO '${WP_DB_USR}'@'%' IDENTIFIED BY '${WP_DB_PWD}';
	GRANT ALL ON *.* TO '${WP_DB_USR}'@'localhost' IDENTIFIED BY '${WP_DB_PWD}';
	FLUSH PRIVILEGES;
	DELETE FROM mysql.user WHERE User='';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	DROP DATABASE IF EXISTS test;
	DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';
	FLUSH PRIVILEGES;
_EOF_
	sed -i "s/password =/password = ${MYSQL_ROOT_PWD}/g" /etc/mysql/debian.cnf
	
	service mysql stop
fi


/usr/bin/mysqld_safe --user=mysql --datadir=/var/lib/mysql
