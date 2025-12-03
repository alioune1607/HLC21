FROM aliounek/ubbase

USER root
RUN apt update && apt install -yq --no-install-recommends \
   nginx 

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

RUN mkdir -p /var/log/nginx
EXPOSE 80

RUN mkdir -p /root/admin/sweb/nginx
COPY ./dockerfiles/base/sweb/nginx /root/admin/sweb/nginx 
RUN chmod +x /root/admin/sweb/nginx/admin/start.sh

# Solo mueve el index si existe
RUN [ -f /var/www/html/index.nginx-debian.html ] && mv /var/www/html/index.nginx-debian.html /var/www/html/index.html || true

WORKDIR /root/admin/sweb/nginx
ENTRYPOINT [ "/root/admin/sweb/nginx/admin/start.sh" ]