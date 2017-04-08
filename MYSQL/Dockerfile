FROM armhf/alpine:latest

COPY ./entrypoint.sh /entrypoint.sh
RUN apk --update add mysql bash && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
