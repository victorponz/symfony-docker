FROM php:8.1.0-apache
ARG DEBIAN_FRONTEND=noninteractive
RUN docker-php-ext-install pdo_mysql
RUN apt-get update \
    && apt-get install -y libzip-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip

RUN docker-php-ext-install zip 
# RUN apt-get update
# Configurar el servidor apache para que sirva symfony-tienda/public
ADD "./apache/000-default.conf/" "/etc/apache2/sites-enabled/000-default.conf"

WORKDIR "/var/www/html/"
# Copiar symfony-tienda en el root de apache
ADD "./symfony-contactos" "/var/www/html/"
ADD "./files/.htaccess" "/var/www/html/public/"
ADD "./files/composer.phar" "/var/www/html/"

# Instalar las dependencias
RUN ./composer.phar install --no-interaction

# Configurar el usuario y grupo para que pertenezca al grupo del servidor
# Directorio de caché
RUN chown -R www-data:www-data /var/www/html/var

# Directorio para assets
RUN chown -R www-data:www-data /var/www/html/public

RUN a2enmod rewrite
