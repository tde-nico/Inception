NAME	= inception
SRC_DIR	= srcs
ENV		= $(SRC_DIR)/.env
YML		= $(SRC_DIR)/docker-compose.yml
USER	= tde-nico

DC		= sudo docker-compose
RM		= sudo rm -rf
MD		= mkdir -p

IMAGES	= $(shell sudo docker images -qa)
VOLUMES	= $(shell sudo docker volume ls -q)

all: start

host:
	@ sudo echo "127.0.0.1 $(USER).42.fr" >> /etc/hosts

dirs:
	@ $(MD) ~/Desktop/data
	@ $(MD) ~/Desktop/data/mariadb
	@ $(MD) ~/Desktop/data/wordpress

start: #dirs
	@ $(DC) --env-file $(ENV) -f $(YML) up

stop:
	@ $(DC) --env-file $(ENV) -f $(YML) down

clean: stop
	@ sudo docker system prune -a -f

clean_mac:
	@ find . -name "*._*" -delete
	@ find . -name "*.DS_Store" -delete

fclean: clean vol_clean dir_clean
#	@ sudo docker rmi -f $(IMAGES)
#	@ sudo docker system prune -a -f
#	@ sudo docker volume rm $(VOLUMES)
#	@ $(RM) ~/Desktop/data

vol_clean:
	@ sudo docker volume rm $(VOLUMES)

dir_clean:
	@ $(RM) /home/$(USER)/data
	@ $(MD) /home/$(USER)/data
	@ $(MD) /home/$(USER)/data/mariadb
	@ $(MD) /home/$(USER)/data/wordpress



image_clean:
	@ sudo docker rmi -f $(IMAGES)

re: fclean reload
	
reload: #dirs
	@ $(DC) --env-file $(ENV) -f $(YML) up --build

tar:
	@ tar -cf ../$(NAME).tar .

setup: host
	@ sudo apt install -y git docker docker.io docker-compose
	@ sudo service docker restart


.PHONY: all start stop clean fclean re host reload tar setup
