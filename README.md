## Introducción

Este proyecto permite crear un contenedor con todo lo necesario para desplegar una aplicación Symfony.

## Configuración del proyecto

Vamos a suponer que tenemos un proyecto llamado `symfony-tienda`.

Este proyecto lo hemos de situar en la raíz del docker. Podemos usar `gitsubmolule` para esta tarea. De esta forma el proyecto en sí reside en otro repositorio. No se debe subir la carpeta `vendor` ya que se regenera en el contenedor.

## Base de datos

Debemos hacer una exportación de la base de datos para que se pueda importar en el primer despliegue de la aplicación y guardarla en la carpeta `dump`

## Modificar Dockerfile

En este fichero hemos del proyecto

```dockerfile
# Copiar symfony-tienda en el root de apache
ADD "./symfony-tienda" "/var/www/html/"
```

## `docker-compose.yml`

Es recomendable modificar el archivo `docker-compose.yml` con los datos del proyecto correcto. De esta forma podemos tener desplegados más de un proyecto.

```yaml
version: "3.1"
services:
    db:
        image: mysql:5.7
        container_name: symfony-tienda-mysql
        ports: 
            - "3306:3306"
        command: --default-authentication-plugin=mysql_native_password
        environment:
            MYSQL_DATABASE: tienda
            MYSQL_PASSWORD: sa
            MYSQL_ROOT_PASSWORD: sa
        volumes:
            - ./dump:/docker-entrypoint-initdb.d
            - mysql:/var/lib/mysql
        networks:
            - default
    symfony-tienda:
        build: .
        ports: 
            - "80:80"
        volumes:
            - images:/var/www/html/symfony-tienda/public/img
        links:
            - db
        networks:
            - default
    phpmyadmin:
        image: phpmyadmin/phpmyadmin
        links: 
            - db:db
        ports:
            - 8000:80
        environment:
            MYSQL_USER: root
            MYSQL_PASSWORD: sa
            MYSQL_ROOT_PASSWORD: sa 
volumes:
    mysql:
    images:
```

