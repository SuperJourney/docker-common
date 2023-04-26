FROM ubuntu:latest


# Dockerfile apt-get update 中国加速

# 设置中国加速源
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list


# 安装 wget
RUN apt-get update && apt-get install -y wget net-tools psmisc lsb-release
 
# 在容器内下载文件
RUN wget "https://down.oray.com/hsk/linux/phddns_5.2.0_amd64.deb" -O phddns_5.2.0_amd64.deb

# 安装 phddns_5.2.0_amd64.deb 文件
RUN dpkg -i phddns_5.2.0_amd64.deb

# 清理临时文件
RUN rm phddns_5.2.0_amd64.deb


COPY ./start.sh /root/start.sh

ENV LOG_HTTP_IP '0.0.0.0'
ENV LOG_HTTP_PORT '11011'