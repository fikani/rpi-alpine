FROM armhf/alpine:latest

RUN apk --update add php5 \
	php5-fpm \
	php5-cli \
	php5-json \
	php5-curl \
	php5-gd \
	php5-imagick \
	php5-pgsql \
	php5-mysql \
	php5-imap \
	php5-xsl \
	php5-ldap \
	php5-memcache \
	php5-mcrypt \
	zlib
RUN apk add bash

COPY ./app.zip /app.zip

RUN mkdir -p /var/www/ && \
	unzip /app.zip -d /var/www && \
	rm /app.zip 

COPY ./php-fpm.conf /etc/php5/php-fpm.conf
ENTRYPOINT ["php-fpm", "--allow-to-run-as-root"]
