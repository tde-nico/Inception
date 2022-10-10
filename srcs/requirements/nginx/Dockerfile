FROM alpine

RUN apk update && apk upgrade && apk add --no-cache \
	nginx \
	openssl

EXPOSE 443

COPY ./conf/* /tmp/

RUN sh /tmp/configure.sh

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

