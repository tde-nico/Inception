NAME	= inception
SRC_DIR	= srcs
ENV		= $(SRC_DIR)/.env
YML		= $(SRC_DIR)/docker-compose.yml
USER	= tde-nico

IMAGES	= $(shell sudo docker images -qa)
VOLUMES	= $(shell sudo docker volume ls -q)

all: start

host:
	@ echo "127.0.0.1 $(USER).42.fr" >> /etc/hosts

start:
	@ sudo docker-compose --env-file $(ENV) -f $(YML) up

stop:
	@ sudo docker-compose --env-file $(ENV) -f $(YML) down

clean: stop

fclean: clean
#	@ sudo docker rmi -f $(IMAGES)
	@ sudo docker volume rm $(VOLUMES)
	@ sudo docker system prune -a -f

re: fclean
	@ sudo docker-compose --env-file $(ENV) -f $(YML) up --build
	
reload:
	@ sudo docker-compose --env-file $(ENV) -f $(YML) up --build

tar:
	@ tar -cf ../$(NAME).tar .

.PHONY: all start stop clean fclean re host
