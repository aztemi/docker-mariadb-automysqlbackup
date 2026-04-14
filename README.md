# docker-mariadb-automysqlbackup

Docker image based on [linuxserver/mariadb](https://github.com/linuxserver/docker-mariadb) with [AutoMySQLBackup](http://sourceforge.net/projects/automysqlbackup/) pre-configured for automated daily database backups.

## Features

- Automated daily backups via cron
- Backs up all databases (excluding system databases)
- Compressed SQL backups
- Supports daily, weekly, and monthly rotation
- Configurable via environment variables

## Usage

```bash
docker run -d \
  --name mariadb-backup \
  -e PUID=1000 \
  -e PGID=1000 \
  -e MYSQL_ROOT_PASSWORD=secret \
  -v /path/to/backups:/backups \
  aztemi/mariadb-automysqlbackup
```

## Configuration

Configure via `/etc/default/automysqlbackup` inside the container or override via environment variables:

| Variable      | Default         | Description                           |
| ------------- | --------------- | ------------------------------------- |
| `DBHOST`      | localhost       | MySQL host                            |
| `DBNAMES`     | all             | Databases to backup (space-separated) |
| `BACKUPDIR`   | /backups        | Backup output directory               |
| `MAILADDR`    | user@domain.com | Email for notifications               |
| `MAILCONTENT` | quiet           | log/files/stdout/quiet                |
| `COMP`        | gzip            | Compression (gzip/bzip2)              |

## Volumes

- `/backups` - Backup output directory

## Building

```bash
docker build -t aztemi/mariadb-automysqlbackup .
```
