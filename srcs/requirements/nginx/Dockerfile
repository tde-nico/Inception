FROM debian:buster

RUN apt-get update && apt-get install -y \
	nginx \
	openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=IT/ST=Rome/L=Rome/O=42/OU=tde-nico/CN=tde-nico.42.fr/emailAddress=tde-nico@student.42roma.it"
COPY ./conf/default etc/nginx/sites-enabled/default
CMD ["nginx", "-g", "daemon off;"]
