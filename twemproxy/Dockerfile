#
# nebula twemproxy
#
# https://github.com/metavige/redis-proxy/dockerfiles/twemproxy
#

# Base image.
FROM nebula/supervisord

MAINTAINER "metavige <metavige@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

# Install confd
RUN curl -x http://192.168.0.107:6588 -qL https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64 -o /tmp/confd && \
    mv /tmp/confd /usr/local/bin/confd && \
    chmod +x /usr/local/bin/confd
RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates

# Install twemproxy
RUN curl -x http://192.168.0.107:6588 -qL https://twemproxy.googlecode.com/files/nutcracker-0.3.0.tar.gz | tar xzf -
RUN cd nutcracker-0.3.0 && ./configure --enable-debug=log && make && mv src/nutcracker /twemproxy
RUN cd /root && rm -rf nutcracker-0.3.0

# Set up run script
ADD run.sh /root/bin/twemproxy-run.sh
RUN chmod 755 /root/bin/twemproxy-run.sh

# Copy confd files
ADD confd/conf.d/twemproxy.toml /etc/confd/conf.d/twemproxy.toml
ADD confd/templates/twemproxy.tmpl /etc/confd/templates/twemproxy.tmpl

# Copy supervisord files
ADD supervisord.conf /etc/supervisor/conf.d/twemproxy.conf

EXPOSE 22 6000 6222

CMD ["/root/bin/twemproxy-run.sh"]
