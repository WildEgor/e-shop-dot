FROM nginx
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY conf/* /etc/nginx/

RUN mkdir api_conf.d
COPY conf/api_conf.d/api.conf /etc/nginx/api_conf.d/api.conf
COPY conf/api_conf.d/centrifugo.conf /etc/nginx/api_conf.d/centrifugo.conf
COPY conf/html /etc/nginx/html

COPY certs/example.com.crt /etc/ssl/certs/example.com.crt
COPY certs/example.com.key /etc/ssl/certs/example.com.key
