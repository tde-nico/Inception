FROM alpine:3.13

RUN apk update && apk upgrade && apk add --no-cache \
	mariadb-client \
	php7 \
	php7-fpm \
	php7-opcache


EXPOSE 9000

COPY ./run.sh /tmp/run.sh

ENTRYPOINT [ "sh", "/tmp/run.sh" ]
