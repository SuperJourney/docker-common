FROM nginx

ARG filename

# RUN apt-get update

# RUN apt-get install openssl

RUN  mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/proxy.key -out /etc/nginx/ssl/proxy.crt -days 365 -subj "/CN=143.42.236.71" && \
    chown root:root /etc/nginx/ssl/* && \
    chmod 600 /etc/nginx/ssl/*



RUN sed -i -e 's/#access_log/access_log/g' /etc/nginx/conf.d/default.conf

COPY ./conf/${filename}.conf /etc/nginx/conf.d

COPY ./www /www