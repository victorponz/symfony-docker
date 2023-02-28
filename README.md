## Introducción

Este proyecto permite crear un contenedor con todo lo necesario para desplegar una aplicación Symfony.

## Configuración del proyecto

Vamos a suponer que tenemos un proyecto llamado `symfony-tienda`.

Este proyecto lo hemos de situar en la raíz del docker. Podemos usar `gitsubmolule` para esta tarea. De esta forma el proyecto en sí reside en otro repositorio.

## Base de datos

Debemos hacer una exportación de la base de datos para que se pueda importar en el primer despliegue de la aplicación y guardarla en la carpeta `dump`

## Modificar Dockerfile

En este fichero hemos del proyecto

```dockerfile
# Copiar symfony-tienda en el root de apache
ADD "./symfony-tienda" "/var/www/html/"
```

