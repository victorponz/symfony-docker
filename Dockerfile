FROM php:8.1.0-apache
ARG DEBIAN_FRONTEND=noninteractive
#RUN docker-php-ext-install mysqli
# Include alternative DB driver
#RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN apt-get update \
    && apt-get install -y libpng-dev \
    && apt-get install -y libzip-dev \
    && apt-get install -y zlib1g-dev \
    && apt-get install -y libonig-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip

RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip 
RUN docker-php-ext-install gd

# Configurar el servidor apache para que sirva symfony-tienda/public
ADD "./apache/000-default.conf/" "/etc/apache2/sites-enabled/000-default.conf"

# Copiar symfony-tienda en el root de apache
ADD "./symfony-tienda" "/var/www/html/"
WORKDIR "/var/www/"

## Corregir permisos
RUN chmod -R 775  html/

# Instalar composer y todas las dependencias
WORKDIR "/var/www/html/"
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN ./composer.phar require  --no-interaction symfony/apache-pack
RUN ./composer.phar install --no-interaction

# Configurar el usuario y grupo para que pertenezca al grupo del servidor
RUN chown -R www-data:www-data *
RUN a2enmod rewrite
