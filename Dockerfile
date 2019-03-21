FROM nginx:1.15
LABEL maintainer='Fabien Schurter <fabien@fabschurt.com>'

COPY config/nginx.conf /etc/nginx/

RUN rm /etc/nginx/conf.d/*

EXPOSE 443
