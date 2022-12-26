# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: karisti- <karisti-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/03 21:21:51 by karisti-          #+#    #+#              #
#    Updated: 2022/07/05 18:51:44 by karisti-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Base image
FROM debian:buster


# Update package list, upgrate and Install needed packages
RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y mariadb-server procps \
	&& rm -rf /var/lib/apt/lists/*

# Swith off the bind address
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/start.sh /tmp


ENTRYPOINT ["/bin/sh", "/tmp/start.sh"]
