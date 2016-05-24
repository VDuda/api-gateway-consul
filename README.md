# HAProxy Consul-template Image

Image for the load balancer layer. 

TODO(Vlad): DOCS

## Building
```
git clone git@github.com:DailyFeats/consul-template-loadbalancer.git
cd consul-template-loadbalancer
docker build . 
#(optional) Tag the image
```
## Running
```
docker run -d -e SERVICE_NAME=rest --name=rest00c9f113d71e -p 80:80 -p 1936:1936 f030e9 -consul=10.6.22.160:8500
```
You must expose port 80 and 1936. Port 80 is used for HTTP requests and Port 1936 is used for HAProxy monitoring

- TODO(Vlad): Add or tokenize the password for HAProxy monitoring
- TODO(Vlad): Add Healthcheck
