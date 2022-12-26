# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: karisti- <karisti-@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/03 21:21:51 by karisti-          #+#    #+#              #
#    Updated: 2022/07/05 18:51:58 by karisti-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Base image
FROM debian:buster

# Update package list, upgrate and Install needed packages
RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y wget mariadb-client php php7.3-fpm php-pear php-cgi php-common php-zip php-mbstring php-net-socket php-gd php-xml-util php-mysql php-gettext php-bcmath \
	&& rm -rf /var/lib/apt/lists/*

# Install Wordpress CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#Config php-fpm
RUN mkdir /run/php
RUN sed "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" -i /etc/php/7.3/fpm/pool.d/www.conf
RUN touch /var/log/php7.3-fpm.log
COPY tools/start.sh /var/www/wordpress/start.sh

RUN chown -R www-data:www-data /run/php /var/log/php7.3-fpm.log /var/www/wordpress

USER www-data
WORKDIR /var/www/wordpress/


ENTRYPOINT ["/bin/sh", "start.sh"]
