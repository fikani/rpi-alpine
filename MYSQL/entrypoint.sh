#!/bin/bash

if [ -f /OK ]; then
	echo "Mysql is already configured!!";
else
	mysql_install_db --user=root > /dev/null
	if [ "$MYSQL_ROOT_PASSWORD" = "" ]; then
		MYSQL_ROOT_PASSWORD=default
		echo "[i] MySQL root Password: $MYSQL_ROOT_PASSWORD"
	fi

	if [ ! -d "/run/mysqld" ]; then
		mkdir -p /run/mysqld
	fi
	cat << EOF > startup.sql
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
UPDATE user SET password=PASSWORD("") WHERE user='root' AND host='localhost';
CREATE DATABASE IF NOT EXISTS wordpress CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS mantis CHARACTER SET utf8 COLLATE utf8_general_ci;
EOF

	/usr/bin/mysqld --user=root --bootstrap --verbose=0 < startup.sql
	rm -f startup.sql
	touch /OK
fi

exec /usr/bin/mysqld --user=root --console
