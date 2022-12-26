# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: karisti- <karisti-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/13 11:52:25 by karisti-          #+#    #+#              #
#    Updated: 2022/07/03 22:07:38 by karisti-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# Project compilation files and directories
DOCKER_COMPOSE_PATH	=	./srcs/docker-compose.yml

DATA_PATH			= /home/karisti-/data
DB_PATH				= $(DATA_PATH)/db/
WP_PATH				= $(DATA_PATH)/wp/

# # # # # # # # # # # # # # # # # # # # # # # # # # # # #

all: start

start:
	@ mkdir -p $(DB_PATH) $(WP_PATH)
	@ grep -qxF '127.0.0.1 karisti-.42.fr' /etc/hosts || echo '127.0.0.1 karisti-.42.fr' >> /etc/hosts
	@ docker-compose -f $(DOCKER_COMPOSE_PATH) up --build

stop:
	@ docker-compose -f $(DOCKER_COMPOSE_PATH) down

clean: stop
	@ docker system prune -a --force

fclean: clean
	@ rm -rf $(DATA_PATH)

re: fclean all

.PHONY: all start stop clean fclean re