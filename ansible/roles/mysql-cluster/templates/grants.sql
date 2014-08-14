# Set the server root password. This should be preseeded by the package installation.
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '{{ mysql_cluster_root_password }}' WITH GRANT OPTION;

# Remove anonymous users
DELETE FROM mysql.user WHERE User='';

# Remove test database and access to it
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';

FLUSH PRIVILEGES;
