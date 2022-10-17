#!/bin/bash

# Set Env
sed -i -e "s/\${DB_NAME}/wordpress/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/\${DB_USER}/tde-nico/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/\${DB_PASSWORD}/kali/g" /var/www/wordpress/wp-config.php;
sed -i -e "s/\${DB_HOST}/mariadb/g" /var/www/wordpress/wp-config.php;

