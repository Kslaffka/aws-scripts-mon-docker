FROM alpine:latest

MAINTAINER Viacheslav Kompaniiets <viacheslav.kompaniiets@sboxinc.com>

# Install monitoring scripts
RUN apk update && apk upgrade &&\
    apk add --no-cache bash wget curl procps py-pip perl perl-libwww perl-datetime-format-natural docker

# Copy scripts inside container
COPY aws-scripts-mon/ /aws-scripts-mon/

# Setup cron
COPY crontab /etc/crontab
RUN crontab /etc/crontab

ENTRYPOINT crond -f