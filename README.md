## Despliegue

Este proyecto define un contenedor con todo lo necesario para desplegar una aplicación **Symfony** con **docker**

## Configuración del proyecto

Vamos a suponer que tenemos un proyecto llamado `redsocial`.

Este proyecto lo hemos de situar en la raíz del proyecto docker. Podemos usar `git submolule` para esta tarea. De esta forma el proyecto en sí reside en otro repositorio. 

```
git submodule add url-del-repositorio
```

No se debe subir al repositorio la carpeta `vendor` ya que se regenera en el contenedor.

## Base de datos

Debemos hacer una exportación de la base de datos, con `phpmyadmin` por ejemplo, para que se pueda importar en el primer despliegue de la aplicación y guardarla en la carpeta `dump`. Por defecto `mysql` intenta ejecutar todos los archivos `sql` que hay en dicha carpeta.

Modificar el archivo `.env` para que la conexión sql apunte a la instalación de `mysql` que en este caso se llama `db`, que se define en el apartado `links` de `docker-compose.yml`

```
DATABASE_URL="mysql://root:sa@db:3306/redsocial?serverVersion=5.7&charset=utf8mb4"
```

## Modificar Dockerfile

En este fichero hemos de modificar el directorio del proyecto por el nombre añadido como submódulo

```dockerfile
# Copiar redsocial en el root de apache
ADD "./redsocial" "/var/www/html/"
```

## `docker-compose.yml`

Es recomendable modificar el archivo `docker-compose.yml` con los datos del proyecto correcto. 

```yaml
version: "3.1"
services:
    db:
        image: mysql:5.7
        # Puedes cambiar el nombre del contenedor
        container_name: mysql-redsocial
        ports: 
            - "3306:3306"
        command: --default-authentication-plugin=mysql_native_password
        environment:
            # Nombre de la base de datos que debe coincidir con .env
            MYSQL_DATABASE: redsocial
            MYSQL_PASSWORD: sa
            MYSQL_ROOT_PASSWORD: sa
        volumes:
            # Se cargan en mysql los archivos del directorio dump
            - ./dump:/docker-entrypoint-initdb.d
            - mysql:/var/lib/mysql
        networks:
            # Todos los contenedores están en la misma red
            - default
    symfony-redsocial:
        build: .
        ports: 
            - "8080:80"
        volumes:
            # Define aquí los directorios que quieres hacer persistentes
            - assets:/var/www/html/public/assets
        links:
            - db:db
        networks:
            - default
    phpmyadmin:
        image: phpmyadmin/phpmyadmin
        links: 
            # Nombre usado en la conexión en el archivo .env
            - db:db
        ports:
            - 8000:80
        environment:
            MYSQL_USER: root
            MYSQL_PASSWORD: sa
            MYSQL_ROOT_PASSWORD: sa 
volumes:
    mysql:
    assets:
networks:
    default:
```

