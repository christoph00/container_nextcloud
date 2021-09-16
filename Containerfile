FROM docker.io/library/httpd:alpine

COPY httpd.conf /usr/local/apache2/conf/httpd.conf

RUN apk add \
  --no-cache \
  --repository http://dl-3.alpinelinux.org/alpine/edge/community \
  nextcloud nextcloud-pgsql postgresql postgresql-client apache2 ca-certificates

VOLUME /var/lib/nextcloud/data
VOLUME /var/lib/nextcloud/apps

EXPOSE 8888

CMD httpd -DFOREGROUND
