apk add nano

nano /etc/apk/repositories

apk add --update docker openrc docker-cli-compose

rc-update add docker boot
service docker start
service docker status

reboot now
