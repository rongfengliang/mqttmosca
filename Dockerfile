# Mosca
#
# VERSION 0.2.1

FROM mhart/alpine-node:4
MAINTAINER Matteo Collina <hello@matteocollina.com>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app/

COPY ./ /usr/src/app/

RUN apk update && \
    npm install -g  pm2  && \
    cd /usr/src/app && npm install

EXPOSE 3000

ENTRYPOINT ["/usr/src/app/bin/pm2", "start","/usr/src/app/app.js"]