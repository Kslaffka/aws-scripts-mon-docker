FROM alpine:latest

MAINTAINER Viacheslav Kompaniiets <viacheslav.kompaniiets@sboxinc.com>

# Install monitoring scripts

RUN apk update && apk upgrade &&\
    apk add --no-cache bash curl procps perl perl-libwww perl-datetime-format-natural

COPY awscreds.template awscreds.template

# Setup cron

ADD crontab /etc/crontab
RUN crontab /etc/crontab

ENTRYPOINT crond -f