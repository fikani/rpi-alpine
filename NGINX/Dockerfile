FROM armhf/alpine:latest
COPY ./nginx.conf /nginx.conf
RUN apk --update add nginx && apk add bash ca-certificates \
	&& mv /nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT ["nginx", "-g", "daemon off;"]
