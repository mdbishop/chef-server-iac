# chef-server-iac
_Standalone Chef Server running in a Docker container_

## Build

To build a Chef Server container, run the following command from within the project
```
docker build -t chef:12.3.1 .
```

## Run
To run the Chef Server container:
```
docker run -d --privileged --p 443 chef:12.3.1
```
## What next
For more information on managing the server via the Chef Server API, go here:
https://docs.chef.io/api_chef_server.html
