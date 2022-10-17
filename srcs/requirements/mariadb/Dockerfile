FROM debian:buster
RUN apt-get update
RUN apt-get install mariadb-server -y
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/createdb.sql /
RUN service mysql start && mysql < createdb.sql
RUN rm -f createdb.sql
CMD /usr/bin/mysqld_safe
