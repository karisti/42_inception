# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: karisti- <karisti-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/03 21:21:51 by karisti-          #+#    #+#              #
#    Updated: 2022/08/07 19:10:47 by karisti-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Base image
FROM debian:buster

# Update package list, upgrade and install needed packages
RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y nginx \
	&& rm -rf /var/lib/apt/lists/*

# nginx SSL
COPY conf/certs /etc/ssl/certs
# RUN openssl req -x509 -nodes -days 365 -subj '/C=ES/ST=Spain/L=Madrid/O=karisti-/OU=IT/CN=karisti-/emailAddress=karisti-@student.42madrid.com' -newkey rsa:2048 -keyout /etc/ssl/certs/nginx_karisti-.key -out /etc/ssl/certs/nginx_karisti-.crt

# nginx config
COPY conf/karisti-.conf /etc/nginx/sites-available/karisti-
RUN ln -s /etc/nginx/sites-available/karisti- /etc/nginx/sites-enabled/karisti- && \
		rm /var/www/html/index.nginx-debian.html


ENTRYPOINT ["nginx", "-g", "daemon off;"]
