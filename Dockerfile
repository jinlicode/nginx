FROM nginx:stable-alpine

RUN add --no-cache certbot

COPY cert/resty-auto-ssl-fallback.crt /etc/ssl/resty-auto-ssl-fallback.crt
COPY cert/resty-auto-ssl-fallback.key /etc/ssl/resty-auto-ssl-fallback.key

# Copy nginx configuration files
COPY nginx-config/nginx.conf /etc/nginx/nginx.conf
COPY nginx-config/jinli_nginx_base_config /etc/nginx/conf/jinli_nginx_base_config