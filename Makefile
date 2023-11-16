containers_name = $(shell sudo docker ps -a -q)

up: 
	mkdir -p /home/yel-khad/data
	mkdir -p /home/yel-khad/data/wordpress
	mkdir -p /home/yel-khad/data/mariadb
	sudo docker-compose -f srcs/docker-compose.yml up -d

stop:
	sudo docker stop $(containers_name)

clean: 
	sudo docker stop $(containers_name)
	sudo docker system prune -a
	sudo rm -rf /home/yel-khad/data

.PHONY: clean stop up