# HAProxy Consul-template Image

Image for the load balancer layer. 

TODO(Vlad): DOCS

## Building

```
git clone git@github.com:DailyFeats/consul-template-loadbalancer.git
cd consul-template-loadbalancer
docker build -t consul-template . 
```

## Starting the consul-template service
```
docker run -d -e SERVICE_NAME=rest --name=rest-haproxy -p 80:80 -p 1936:1936 consul-template -consul=$IP:8500
```
You must expose port 80 and 1936. Port 80 is used for HTTP requests and Port 1936 is used for HAProxy monitoring

## Testing
For simply testing and to see what haproxy config the consul-template will generate.
```
docker run --rm consul-template -consul=$IP:8500 -dry -once
```

- TODO(Vlad): Add or tokenize the password for HAProxy monitoring
- TODO(Vlad): Add Healthcheck
