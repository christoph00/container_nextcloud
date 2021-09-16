FROM docker.io/library/alpine:edge

RUN apk add \
  --no-cache \
  --repository http://dl-3.alpinelinux.org/alpine/edge/community \
  nextcloud nextcloud-pgsql postgresql postgresql-client apache2 ca-certificates php8-apache2 \
  nextcloud-theming nextcloud-activity nextcloud-files_external nextcloud-files_pdfviewer nextcloud-files_rightclick \
  nextcloud-files_sharing nextcloud-files_trashbin nextcloud-files_videoplayer nextcloud-notifications \
  nextcloud-photos nextcloud-serverinfo nextcloud-sharebymail nextcloud-systemtags nextcloud-text \
  nextcloud-user_status \
  php8-pecl-redis php8-pecl-apcu php8-opcache

COPY httpd.conf /etc/apache2/httpd.conf
COPY 10-nextcloud.ini /etc/php8/conf.d/10-nextcloud.ini

VOLUME /var/lib/nextcloud/data
VOLUME /var/lib/nextcloud/apps

EXPOSE 8088

CMD httpd -DFOREGROUND
