FROM debian:jessie
RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list
RUN apt-get update && apt-get upgrade && apt-get install -y apache2 libapache2-mod-fastcgi php5-fpm
RUN a2enmod actions
RUN mv /etc/apache2/mods-enabled/fastcgi.conf /etc/apache2/mods-enabled/fastcgi.conf.backup
COPY fastcgi.conf /etc/apache2/mods-enabled/
COPY apache2.conf /etc/apache2/
EXPOSE 80
RUN a2enmod rewrite
ENTRYPOINT service apache2 start && service php5-fpm start && bash

