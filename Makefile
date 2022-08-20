# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lelle <lelle@student.21-school.ru>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/19 20:14:54 by lelle             #+#    #+#              #
#    Updated: 2022/07/19 20:23:28 by lelle            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: 	up

up:
	mkdir -p /home/${USER}/data/data/
	mkdir -p /home/${USER}/data/wp_files/
	docker-compose -f srcs/docker-compose.yml up -d
# -f flag specifies the location of a Compose configuration file

down:
	docker-compose -f srcs/docker-compose.yml down

ps:
	cd ./srcs/ && docker-compose ps

re:
	docker-compose -f srcs/docker-compose.yml  up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v --remove-orphans
	sudo rm -rf /home/${USER}/data/data /home/${USER}/data/wp_files
	

check:
	docker ps
	docker images
	docker network ls
	docker volume ls


