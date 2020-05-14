# Dynu DDNS Updater

This repository contains the Dockerfile used to build the dynu-ddns-updater container image from:

[https://hub.docker.com/r/nortismo/dynu-ddns-updater](https://hub.docker.com/r/nortismo/dynu-ddns-updater)

This container can be used to update your dynamic dns entry on [dynu.com](https://www.dynu.com/) on a regular basis, typically running on a server. Currently the job gets executed once every 10 minute.

The container image is derivated from `alpine:3.9` to keep the memory footprint small and it works on different architectures like `x86`, `Arm` and `Arm64`. You need to make sure that you provide the required environment variables which are described below.

## Configuration

To use this container image, you need to use a [docker-compose](https://docs.docker.com/compose/) to provide additional required information. The running container requires three different environment variables to be able to update your entry on [dynu.com](https://www.dynu.com/). 

- DYNU_USERNAME: This is your username which you usually use to log in on [dynu.com](https://www.dynu.com/).
- DYNU_PASSWORD: This is your password which you usually use to log in on [dynu.com](https://www.dynu.com/).
- DYNU_DDNS_DOMAIN: This is the domain name which registered on [dynu.com](https://www.dynu.com/). This could be a top level domain like yourdomain.com, a third level domain like something.yourdomain.com or a free subdomain of a dynamic dns provider like yourdomain.ddnsfree.com.

## Run with docker-compose

Use following example to derivate a docker-compose.yml for your usecase:

```
version: '3.3'
services:
  alpine:
    image: nortismo/dynu-ddns-updater
    restart: always
    container_name: dynu-ddns-updater
    environment:
      - DYNU_USERNAME=<type-in-your-username-here>
      - DYNU_PASSWORD=<type-in-your-password-here>
      - DYNU_DDNS_DOMAIN=<type-in-your-domain-here>
```

You can then start the container with `docker-compose up` or directly in detached-mode with `docker-compose up -d`.