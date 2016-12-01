FROM debian:jessie
MAINTAINER viniciusmarangoni
RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y apache2 libapache2-mod-fastcgi php5-fpm php5-mysql
RUN a2enmod actions
RUN mv /etc/apache2/mods-enabled/fastcgi.conf /etc/apache2/mods-enabled/fastcgi.conf.backup
COPY fastcgi.conf /etc/apache2/mods-enabled/
COPY apache2.conf /etc/apache2/
RUN sed -i 's/upload_max_filesize = .*/upload_max_filesize = 15M/' /etc/php5/fpm/php.ini
RUN sed -i 's/post_max_size = .*/post_max_size = 15M/' /etc/php5/fpm/php.ini
RUN a2enmod rewrite
RUN echo "clear_env=no" >> /etc/php5/fpm/php-fpm.conf
COPY start.sh /root/
RUN chmod +x /root/start.sh
CMD /root/start.sh
