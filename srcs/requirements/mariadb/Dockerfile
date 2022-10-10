FROM alpine

RUN apk update && apk upgrade && apk add --no-cache \
	mariadb \
	mariadb-client


EXPOSE 3306

COPY ./conf/* /tmp/

ENTRYPOINT [ "sh", "/tmp/configure.sh" ]
