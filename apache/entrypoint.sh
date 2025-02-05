#! /bin/bash

a2enmod rewrite
a2ensite mail
a2dissite 000-default
service apache2 restart

cron -f