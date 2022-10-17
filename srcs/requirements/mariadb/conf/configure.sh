#!/bin/bash

# Set Env
#sed -i -e "s/\${DB_USER}/tde-nico/g" /tmp/50-server.cnf;
#sed -i -e "s/\${DB_PASSWORD}/kali/g" /tmp/50-server.cnf;

sed -i -e "s/\${DB_USER}/tde-nico/g" /createdb.sql;
sed -i -e "s/\${DB_PASSWORD}/kali/g" /createdb.sql;
sed -i -e "s/\${DB_NAME}/wordpress/g" /createdb.sql;
sed -i -e "s/\${MYSQL_ROOT_PWD}/kali/g" /createdb.sql;


