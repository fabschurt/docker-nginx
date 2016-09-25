FROM alpine:3.3
MAINTAINER Fabien Schurter <fabien@fabschurt.com>

RUN apk update --no-cache   && \
    apk add nginx           && \
    rm -rf /var/cache/apk/*
COPY config/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx"]
