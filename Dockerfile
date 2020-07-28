FROM nginx:stable-alpine

RUN apk add --no-cache certbot certbot-nginx

COPY cert/resty-auto-ssl-fallback.crt /etc/ssl/default.crt
COPY cert/resty-auto-ssl-fallback.key /etc/ssl/default.key

# 增加环境变量
ENV PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Copy nginx configuration files
COPY nginx-config/nginx.conf /etc/nginx/nginx.conf
COPY nginx-config/jinli_nginx_base_config /etc/nginx/jinli_nginx_base_config
