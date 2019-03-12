FROM postgres:10.7-alpine@sha256:1ac12ae2c84fc28791e6a8ee039ea1d566140f3f2602290aa8c8e1a10f2d03f9

MAINTAINER Leonardo Gatica <lgatica@protonmail.com>

RUN apk add --no-cache py2-pip && pip install awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=us-east-1

COPY entrypoint.sh /usr/local/bin/entrypoint
COPY backup.sh /usr/local/bin/backup
COPY pguri.py /usr/local/bin/pguri

VOLUME /backup

CMD /usr/local/bin/entrypoint
