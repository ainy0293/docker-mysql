#!/bin/bash

dir_null=$(ls /usr/local/mysql/data)

if [[ -z $MYSQL_ROOT_PASSWORD ]]; then
        echo "Error, You not define mysql root password"
	echo -e "Usage: docker run -d -p 3306:3306 --name mysql-server \033[31m -e MYSQL_ROOT_PASSWORD=your_password \033[0m ainy/mysql"
        exit 1
fi

#if [[ -z $MYSQL_USER ]]; then
	MYSQL_USER=root
#fi

#if [[ -z $DATABASE ]]; then
	DATABASE=*
#fi

if [[ -z $dir_null ]]; then
	if [[ -z $MYSQL_ALLOW_HOST ]]; then
		echo "You not define mysql allow connect host,usage default value"
		echo "default values is % , allow all host connection to this MySQL Server"
	        MYSQL_ALLOW_HOST=%
	fi

        /usr/local/mysql/bin/mysqld --initialize-insecure --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data  --user=mysql > /dev/null 2>&1
        chgrp mysql /usr/local/mysql/.
        /etc/init.d/mysql start > /dev/null 2>&1

	if [ $DATABASE != * ]; then
		mysql -uroot -e "create database $DATABASE"
	fi

	/usr/local/mysql/bin/mysql -uroot -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${MYSQL_USER}'@'${MYSQL_ALLOW_HOST}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	/usr/local/mysql/bin/mysql -uroot -e "FLUSH PRIVILEGES;"
	/etc/init.d/mysql stop > /dev/null 2>&1
	rm -f /tmp/mysql.sock.lock
	/usr/local/mysql/bin/mysqld_safe
else
	rm -f /tmp/mysql.sock.lock
	/usr/local/mysql/bin/mysqld_safe
fi

