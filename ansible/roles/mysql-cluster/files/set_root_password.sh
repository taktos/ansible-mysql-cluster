#!/bin/sh
/usr/bin/mysql -u root --connect-expired-password -e "SET PASSWORD FOR root@localhost = PASSWORD('`echo $1`');" -p`head -n 1 /root/.mysql_secret | awk '{print $(NF - 0)}'`
if [ $? -e 0 ]; then
  mv /root/.mysql_secret /root/.mysql_secret_old
fi

