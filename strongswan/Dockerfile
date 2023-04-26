FROM buildpack-deps:buster

RUN apt-get update && apt-get install -y \
    libgmp-dev \
    iptables \
    kmod \
    && rm -rf /var/lib/apt/lists/* \
    # Starting with Debian Buster iptables uses nf_tables as a backend for iptables.
    # Since we use iptables on the host we have to switch the backend:
    # https://wiki.debian.org/iptables
    && update-alternatives --set iptables /usr/sbin/iptables-legacy \
    && update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy


ENV STRONGSWAN_VERSION='strongswan-5.9.0'

ENV STRONGSWAN_FILE="${STRONGSWAN_VERSION}.tar.gz"

RUN  wget --no-check-certificate https://download.strongswan.org/${STRONGSWAN_FILE} && \
     tar xzf ${STRONGSWAN_FILE} && \
     cd ${STRONGSWAN_VERSION}  && ./configure  --enable-eap-identity --enable-eap-md5 \
--enable-eap-mschapv2 --enable-eap-tls --enable-eap-ttls --enable-eap-peap  \
--enable-eap-tnc --enable-eap-dynamic --enable-eap-radius --enable-xauth-eap  \
--enable-xauth-pam  --enable-dhcp  --enable-openssl  --enable-addrblock --enable-unity  \
--enable-certexpire --enable-radattr --enable-swanctl --enable-openssl --disable-gmp && make && make install

# RUN rm /etc/ipsec.secrets
# RUN mkdir -p /etc/ipsec.d/conf && touch /etc/ipsec.d/conf/placeholder.conf
# RUN echo "include /etc/ipsec.d/conf/*.conf" >> /etc/ipsec.conf

# ADD ipsec_start /usr/local/bin/ipsec_start
# ADD pipework /usr/local/bin/pipework

# VOLUME /etc/ipsec.d

# EXPOSE 4500/udp 500/udp

# ENTRYPOINT ["/usr/local/bin/ipsec_start"]
# CMD []