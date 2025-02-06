# Squirrelmail

![Squirrel](images/squirrel.png)

## Estructura

Dos maquinas docker, una para postfix y dovecot, y otra para apache2 y php. 

El propósito es hacer un servidor de email con squirrelmail.

### Mail

Contiene los archivos necesarios para configurar ambos servicios y se crearán dos usarios.

Debemos llamarla en el docker compose igual que pondremos en la configuracion de squirrel, ya que es su identificador.

### Apache

Contiene la carpeta de squirrel y las configuraciones pertinentes para apache y php.

También es importante la version del contenedor, debe ser la 7.4

## Docker

Para iniciar las maquinas:

```bash
docker-compose up -d --build
```
