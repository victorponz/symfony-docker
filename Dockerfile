FROM php:8.1.0-apache
ARG DEBIAN_FRONTEND=noninteractive
RUN docker-php-ext-install pdo_mysql
# RUN apt-get update
# Configurar el servidor apache para que sirva symfony-tienda/public
ADD "./apache/000-default.conf/" "/etc/apache2/sites-enabled/000-default.conf"

# Copiar symfony-tienda en el root de apache
ADD "./symfony-tienda" "/var/www/html/"
WORKDIR "/var/www/"

## Corregir permisos
# RUN chmod -R 775  html/

# Instalar composer y todas las dependencias
WORKDIR "/var/www/html/"
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
# RUN ./composer.phar require  --no-interaction symfony/apache-pack
RUN ./composer.phar install --no-interaction

# Configurar el usuario y grupo para que pertenezca al grupo del servidor
# RUN chown -R www-data:www-data *
RUN a2enmod rewrite
