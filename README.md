# 42_inception

![Demo image](https://github.com/karisti/42_inception/blob/master/demo1.jpg?raw=true)


## Description
This project consists in having you set up a small infrastructure composed of three different services running in different Docker containers, connected between them by a docker-network. The three services are an nginx server, WordPress with php-fpm and an MariaDB database. Also, it will have two volumes for the WorPress database and the WordPress website files, making this data persistent on the host. In case of crash, the containers are restarted automatically. [ft_server](https://github.com/karisti/42_ft_server "ft_server") is the project that precedes this one.

## Lessons
- Docker: creation of custom images
- Docker-compose: configuration, networks, volumes, environment variables, service dependencies and service healthchecks
- Nginx web server configuration with and without SSL
- Wordpress website installation and configuration
- MariaDB database installation and configuration

## Prerequisites
- Docker
- Docker-compose
- VM or host with permissions to modify `/etc/hosts`

## Usage
1. Change `DATA_PATH` on Makefile, and `MARIADB_HOST_VOLUME_PATH` and `WORDPRESS_HOST_VOLUME_PATH` on ./srcs/.env to your own paths. Customize .env with your own configuration.
2. `make start`


## Resources
#### Basic docker / docker-compose configuration
- [Get started with Docker-compose](https://docs.docker.com/compose/gettingstarted/ "Get started with Docker-compose")
- [Docker-compose dependencies between services](https://docs.docker.com/compose/startup-order/ "Docker-compose dependencies between services")
- [Docker-compose environment variables](https://docs.docker.com/compose/environment-variables/ "Docker-compose environment variables")
- [Docker-compose Networking overview](https://docs.docker.com/network/ "Docker-compose Networking overview")
- [Docker-compose Use volumes](https://docs.docker.com/storage/volumes/ "Docker-compose Use volumes")
- [Docker-compose healthcheck](https://stackoverflow.com/questions/42567475/docker-compose-check-if-mysql-connection-is-ready "Docker-compose healthcheck")
- [Docker CMD vs ENTRYPOINT](https://www.bmc.com/blogs/docker-cmd-vs-entrypoint/#:~:text=In%20Dockerfiles%2C%20an%20ENTRYPOINT%20instruction,with%20command%20line%20arguments%20stated.https://mariadb.com/kb/en/mysql_install_db/ "Docker CMD vs ENTRYPOINT")
- [Docker Compose in 12 Minutes [YouTube]](https://www.youtube.com/watch?v=Qw9zlE3t8Ko "Docker Compose in 12 Minutes [YouTube]")
- [Docker Compose Tutorial - Docker in Practice [YouTube]](https://www.youtube.com/watch?v=MVIcrmeV_6c "Docker Compose Tutorial - Docker in Practice [YouTube]")
- [Introducción a Docker Compose [YouTube]](https://www.youtube.com/watch?v=i-45V0ojtlI "Introducción a Docker Compose [YouTube]")
- [CÓMO escribir LOS MEJORES Dockerfiles [YouTube]](https://www.youtube.com/watch?v=QXlQDV9FZhI "CÓMO escribir LOS MEJORES Dockerfiles [YouTube]")
- [Node, Mongo & Docker Compose [YouTube]](https://www.youtube.com/watch?v=w1v6DspnUBQ "Node, Mongo & Docker Compose [YouTube]")

#### Nginx installation and configuration
- [Nginx Worpress recipe](https://www.nginx.com/resources/wiki/start/topics/recipes/wordpress/ "Nginx Worpress recipe")
- [Configure Nginx to use TLS 1.2 / 1.3 only](https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/ "Configure Nginx to use TLS 1.2 / 1.3 only")
- [Nginx failing to reload - how to track down why?](https://askubuntu.com/questions/443775/nginx-failing-to-reload-how-to-track-down-why "Nginx failing to reload - how to track down why?")
- [Como recargar y reiniciar Nginx](https://help.dreamhost.com/hc/es/articles/216454967-Como-recargar-y-reiniciar-Nginx "Como recargar y reiniciar Nginx")

#### MariaDB installation and configuration
- [Automating 'mysql_secure_installation'](https://bertvv.github.io/notes-to-self/2015/11/16/automating-mysql_secure_installation/ "Automating `mysql_secure_installation`")
- [mysqld_safe — MySQL Server Startup Script](https://dev.mysql.com/doc/refman/8.0/en/mysqld-safe.html "mysqld_safe — MySQL Server Startup Script")
- [How To Install MariaDB on Debian 10](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-10 "How To Install MariaDB on Debian 10")
- [How to Install MariaDB on Debian 11](https://osnote.com/how-to-install-mariadb-on-debian-11/ "How to Install MariaDB on Debian 11")
- [Installing and Securing MariaDB on Ubuntu Bionic](https://www.scaleway.com/en/docs/tutorials/mariadb-ubuntu-bionic/ "Installing and Securing MariaDB on Ubuntu Bionic")
- [How to run Mariadb with Docker and Docker-Compose](https://citizix.com/how-to-run-mariadb-with-docker-and-docker-compose/ "How to run Mariadb with Docker and Docker-Compose")
- [It's mysql or mysqld?](https://stackoverflow.com/questions/25905657/its-mysql-or-mysqld "It's mysql or mysqld?")
- [MariaDB basic usage](https://www.cyberciti.biz/faq/how-to-show-list-users-in-a-mysql-mariadb-database/ "MariaDB basic usage")
- [SHOW DATABASES Statement](https://dev.mysql.com/doc/refman/8.0/en/show-databases.html#:~:text=SHOW%20DATABASES%20lists%20the%20databases,%E2%80%9CExtensions%20to%20SHOW%20Statements%E2%80%9D. "SHOW DATABASES Statement")

#### Worpress + php-fpm installation and configuration
- [Install Wordpress CLI](https://make.wordpress.org/cli/handbook/guides/installing/#using-a-custom-php-binary "Install Wordpress CLI")
- [wp config create](https://developer.wordpress.org/cli/commands/config/create/ "wp config create")
- [How to Install WordPress Using WP-CLI on Debian 10](https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/ "How to Install WordPress Using WP-CLI on Debian 10")
- [httpd and php-fpm dockerfile, unable to run php-fpm with non-root user](https://stackoverflow.com/questions/67386846/httpd-and-php-fpm-dockerfile-unable-to-run-php-fpm-with-non-root-user "httpd and php-fpm dockerfile, unable to run php-fpm with non-root user")
- [php-fpm(8) - Linux man page](https://linux.die.net/man/8/php-fpm "php-fpm(8) - Linux man page")
- [PHP-FPM: Configuration the Listen Directive [VIDEO]](https://serversforhackers.com/c/php-fpm-configuration-the-listen-directive "PHP-FPM: Configuration the Listen Directive [VIDEO]")

#### Others
##### System administration
- [How to Use sed to Find and Replace String in Files](https://linuxize.com/post/how-to-use-sed-to-find-and-replace-string-in-files/ "How to Use sed to Find and Replace String in Files")
- [Learning Linux Commands: sed](https://linuxconfig.org/learning-linux-commands-sed "Learning Linux Commands: sed")
- [How to Use Heredoc in Shell Scripting](https://www.tecmint.com/use-heredoc-in-shell-scripting/ "How to Use Heredoc in Shell Scripting")
- [How to use sed to find and replace text in files in Linux / Unix shell](https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/ "How to use sed to find and replace text in files in Linux / Unix shell")
- [3 Ways to Delete All Files in a Directory Except One or Few Files with Extensions](https://www.tecmint.com/delete-all-files-in-directory-except-one-few-file-extensions/ "3 Ways to Delete All Files in a Directory Except One or Few Files with Extensions")
- [What’s Special With Pid 1?](https://vagga.readthedocs.io/en/latest/pid1mode.html "What’s Special With Pid 1?")
