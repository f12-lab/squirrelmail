#! /bin/bash

service postfix restart
service dovecot restart

cron -f