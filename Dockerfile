FROM ubuntu

ENV CONSUL_TEMPLATE_VERSION=0.14.0

# Update wget to get support for SSL
RUN apt-get update && apt-get install haproxy wget unzip -y

# Download consul-template
RUN ( wget --no-check-certificate https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip -O /tmp/consul_template.zip && unzip /tmp/consul_template.zip && mv consul-template /usr/bin && rm -rf /tmp/* )

COPY haproxy.json /haproxy.json
COPY haproxy.ctmpl /haproxy.ctmpl

ENTRYPOINT ["consul-template","-config=/haproxy.json"]
CMD ["-consul=consul.service.consul:8500"]
