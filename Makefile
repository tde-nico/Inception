NAME	= inception
YML		= srcs/docker-compose.yml
USER	= tde-nico

IMAGES	= $(shell sudo docker images -qa)
VOLUMES	= $(shell sudo docker volume ls -q)

all: start

host:
	@ echo "127.0.0.1 $(USER).42.fr" >> /etc/hosts

start:
	@ docker-compose -f $(YML) up

stop:
	@ docker-compose -f $(YML) down

clean: stop

fclean: clean
	@ sudo docker rmi -f $(IMAGES)
	@ sudo docker volume rm $(VOLUMES)
	@ docker system prune -a -f

re: fclean
	@ docker-compose -f $(YML) up --build


.PHONY: all start stop clean fclean re host
