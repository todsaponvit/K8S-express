#!/bin/ash

apk add nano

nano /etc/apk/repositories
# http://dl-cdn.alpinelinux.org/alpine/v3.21/main/
# http://dl-cdn.alpinelinux.org/alpine/v3.21/community/

apk add --update docker openrc docker-cli-compose

rc-update add docker boot
service docker start
service docker status

reboot now
