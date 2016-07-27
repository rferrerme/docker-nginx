FROM ubuntu:14.04

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    supervisor \
    wget

RUN wget http://nginx.org/keys/nginx_signing.key
RUN apt-key add nginx_signing.key
RUN echo "deb http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y nginx

# Avoids data corruption
RUN sed -i "s/sendfile        on/sendfile        off/g" /etc/nginx/nginx.conf

# To be provided via volume: /nginx/default.conf
RUN mkdir /nginx
RUN touch /nginx/default.conf
RUN rm /etc/nginx/conf.d/default.conf
RUN ln -s /nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["/usr/bin/supervisord", "-c", "/supervisor/supervisord.conf"]