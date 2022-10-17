CREATE DATABASE wordpress;
CREATE USER 'tde-nico'@'%' IDENTIFIED BY 'kali';
GRANT ALL PRIVILEGES ON wordpress.* TO 'tde-nico'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'kali';
