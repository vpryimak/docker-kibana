# Kibana

FROM ubuntu:trusty

ADD ./src /

RUN chmod +x /usr/local/sbin/start.sh
 

# Install Kibana
RUN cd /tmp \
    && apt-get install -y curl \
    && curl -O https://download.elasticsearch.org/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz \
    && tar xzf kibana-*.tar.gz \
    && rm kibana-*.tar.gz \
    && mv kibana-* /opt/kibana

RUN groupadd -r kibana \
    && useradd -c "Kibana" -g kibana -M -r -s /sbin/nologin kibana

ENTRYPOINT ["/usr/local/sbin/start.sh"]

EXPOSE 5601
