FROM linuxserver/mariadb:latest

COPY automysqlbackup /usr/sbin/
COPY cron.daily/automysqlbackup /etc/periodic/daily/

RUN chmod +x /usr/sbin/automysqlbackup /etc/periodic/daily/automysqlbackup
