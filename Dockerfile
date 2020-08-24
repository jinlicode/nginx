FROM ubuntu:20.04

RUN apt update \
    && apt -y upgrade\
    && apt install --no-install-recommends -y nginx-full cron certbot python3-certbot-nginx logrotate curl\
    && rm -rf /etc/cron.daily/logrotate \
    && echo "59 11 * * * root /usr/bin/certbot renew > /dev/null" >> /etc/crontab \
    && echo "59 11 * * * root /opt/tongji.sh > /dev/null" >> /etc/crontab
COPY sh/tongji.sh /opt/tongji.sh
COPY cert/resty-auto-ssl-fallback.crt /etc/ssl/default.crt
COPY cert/resty-auto-ssl-fallback.key /etc/ssl/default.key
COPY logrotate/nginx /etc/logrotate.d/nginx

# 增加环境变量
ENV PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone

# Copy nginx configuration files
COPY nginx-config/nginx.conf /etc/nginx/nginx.conf
COPY nginx-config/jinli_nginx_base_config /etc/nginx/jinli_nginx_base_config

ADD run.sh /run.sh

RUN chmod +x /run.sh
RUN chmod +x /opt/tongji.sh
CMD [ "/run.sh" ]