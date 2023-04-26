FROM redis

ARG PORT=7000

COPY ${PORT}/redis.conf /usr/local/etc/redis/redis.conf

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]