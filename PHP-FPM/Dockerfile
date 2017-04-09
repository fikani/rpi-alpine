FROM armhf/alpine:latest

RUN apk --update add php5 \
	php7-fpm \
	php7-json \
	php7-mysqli \
	php7-zlib \
	php7-curl \
	php7-openssl \
	bash

COPY ./app.zip ./php-fpm.conf ./www.conf /

RUN mkdir -p /var/www/ && \
	unzip /app.zip -d /var/www && \
	rm /app.zip && \
	mv /php-fpm.conf /etc/php7/php-fpm.conf && \
	mv /www.conf /etc/php7/php-fpm.d/www.conf

ENTRYPOINT ["php-fpm7", "--allow-to-run-as-root"]
