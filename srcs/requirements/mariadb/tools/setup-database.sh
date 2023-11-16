#!/bin/bash
service mariadb start 

mariadb -e  "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> sql.sql
mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root --password=$MYSQL_ROOT_PASSWORD shutdown

mysqld_safe