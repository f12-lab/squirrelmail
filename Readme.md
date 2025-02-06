# Squirrelmail

![Squirrel](images/squirrel.png)

## Estructura

Dos maquinas docker, una para postfix y dovecot, y otra para apache2 y php. 

El propósito es hacer un servidor de email con squirrelmail.

## Mail

Contiene los archivos necesarios para configurar ambos servicios y se crearán dos usarios.

Debemos llamarla en el docker compose igual que pondremos en la configuracion de squirrel, ya que es su identificador.

### Postfix

Cambios en main.cf

Para decirle cual es el hostname y el destino
```bash
myhostname = mail
mydestination = $myhostname, manuel.local, mail, localhost.localdomain, localhost
```

Decir que el directorio es Maildir
```bash
home_mailbox = Maildir/
```

### Dovecot

Necesitaremos dos archivos `10-auth.conf` y `10-mail.conf` (en caso de que tengamos claves podemos modificar `10-ssl.conf`)

#### 10-auth.conf
Tendremos que habilitar:
```bash
disable_plaintext_auth = no
```

Y añadir login:
```bash
auth_mechanisms = plain login
```

#### 10-mail.conf

En este archivo debemos especificar donde crear el mailbox:
```bash
mail_location = maildir:~/Maildir
```

## Apache

Contiene la carpeta de squirrel y las configuraciones pertinentes para apache y php.

También es importante la version del contenedor, debe ser la 7.4

Dentro de este contenedor deberemos irnos a donde hemos copiado squirrel, e iniciar el archivo `squirrel/config/conf.pl`, al iniciarlo deberemos configurarlo, le cambiaremos el provedor imapd a dovecot y el dominio al nuestro, después le podemos cambiar el nombre. Esta configuracion creará el archivo `config.php` dentro de la misma carpeta.

También deberemos modificar el archivo mail.conf que es el host virtual para que se muestre la página de squirrel que estará en `/var/www/mail`.

En caso en que en la página de squirrel se nos muestren warnings de php, podemos hacer un php.ini para quitarlos.

## Docker

Para iniciar las maquinas:

```bash
docker-compose up -d --build
```
