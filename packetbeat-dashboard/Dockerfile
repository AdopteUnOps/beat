FROM docker.elastic.co/beats/packetbeat:5.6.4

ENV ELASTICSEARCH_HOST elasticsearch
ENV ELASTICSEARCH_PORT 9200
ENV SERVICE_ELASTICSEARCH_USERNAME ""
ENV SERVICE_ELASTICSEARCH_PASSWORD ""
ENV ONLY_DASHBOARDS true
ENV PREFIX_INDEX ""

ADD dashboard /tmp/dashboard

ADD install.sh /tmp/install.sh

CMD ["/tmp/install.sh"]
