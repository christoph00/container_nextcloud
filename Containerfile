FROM docker.io/library/alpine:edge

COPY httpd.conf /etc/apache2/httpd.conf

RUN apk add \
  --no-cache \
  --repository http://dl-3.alpinelinux.org/alpine/edge/community \
  nextcloud nextcloud-pgsql postgresql postgresql-client apache2 ca-certificates php8-apache2

VOLUME /var/lib/nextcloud/data
VOLUME /var/lib/nextcloud/apps

EXPOSE 8088

CMD httpd -DFOREGROUND
