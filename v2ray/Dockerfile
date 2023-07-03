FROM v2fly/v2fly-core

ARG SERVER_IP=172.104.174.201
ARG PLATFORM

COPY ./${PLATFORM}/config.json /etc/v2ray/config.json


RUN sed -i "s/<your ip>/${SERVER_IP}/" /etc/v2ray/config.json


# CMD [ "run","--config=/etc/v2ray/config.json"]