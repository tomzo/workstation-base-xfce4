# Xfce desktop in docker

This image contains basic xfce4 desktop environment.
It is meant to be used as base image for your workstation.

## Use with docker-compose

`docker-compose.yml`
```
workstation:
  build: .
  environment:
    DISPLAY: unix:0.0         # mandatory
    DOCKERSTATION_USER: tomzo # mandatory
  privileged: true            # mandatory
  stdin_open: true
  tty: true
  volumes:
   - /tmp/.X11-unix:/tmp/.X11-unix # mandatory
   - /home/tomzo:/home/tomzo
```

`Dockerfile`
```
FROM tomzo/workstation-base-xfce4

CMD ["/sbin/my_init"]

# GPU drivers must be added late because they must match with host
RUN apt-get update && apt-get install -y nvidia-340

# user is not known until dockerstation host is
RUN groupadd tomzo --gid 1000 && useradd tomzo --uid 1000 --gid 1000 --home /home/tomzo 
# It is practical to have full sudo inside container in case image is missing some development tools
RUN echo 'tomzo ALL=(ALL:ALL) ALL' >> /etc/sudoers
```
