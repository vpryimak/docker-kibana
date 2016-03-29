FROM ubuntu:trusty 
MAINTAINER Viacheslav Pryimak <vpryimak@intropro.com"

################## BEGIN INSTALLATION ######################
ADD ./src /
RUN chmod +x /usr/local/sbin/start.sh
RUN cd /tmp \
    && apt-get install -y curl \
    && curl -O https://download.elastic.co/kibana/kibana/kibana-4.4.2-linux-x64.tar.gz \
    && tar xzf kibana-*.tar.gz \
    && rm kibana-*.tar.gz \
    && mv kibana-* /opt/kibana
RUN groupadd -r kibana \
    && useradd -c "Kibana" -g kibana -M -r -s /sbin/nologin kibana
RUN chown -R kibana:kibana /opt/kibana
##################### INSTALLATION END #####################

ENTRYPOINT ["/usr/local/sbin/start.sh"]
EXPOSE 5601
