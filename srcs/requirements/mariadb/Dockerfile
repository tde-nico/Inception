FROM debian:buster
RUN apt-get update
RUN apt-get install mariadb-server -y
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/createdb.sql /
COPY ./conf/configure.sh /tmp/configure.sh
#COPY ./run.sh /tmp/run.sh
#RUN sh /tmp/configure.sh
#RUN service mysql start && mysql < createdb.sql
#RUN rm -f createdb.sql
CMD [ "sh", "/tmp/configure.sh" ]
#CMD [ "sh", "/tmp/run.sh" ]
#CMD /usr/bin/mysqld_safe
