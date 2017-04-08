#!/bin/sh

addgroup -S www-data
adduser -S -g www-data www-data
chown -R www-data:www-data /var/www

exec php-fpm
