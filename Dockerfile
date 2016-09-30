FROM alpine:3.3
MAINTAINER Fabien Schurter <fabien@fabschurt.com>

RUN apk update --no-cache                      && \
    apk add nginx                              && \
    rm -rf /var/cache/apk/*                    && \
    mkdir /etc/nginx/servers.d                 && \
    cd /var/lib/nginx/tmp                      && \
    mkdir client_body fastcgi proxy scgi uwsgi && \
    chown -Rc nginx:nginx ..                   && \
    chmod -Rc 0700 ..
COPY config/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx"]
