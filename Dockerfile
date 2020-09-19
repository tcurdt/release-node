FROM alpine:3.12

ENV NODE_VERSION 14.2.0
ENV ARCH x64

# && apk add --no-cache nodejs-npm \

WORKDIR /app
ADD . .
ENV NPM_CONFIG_LOGLEVEL warn
RUN apk update && apk upgrade \
 && apk add --no-cache ca-certificates curl \
 && curl -fsSLO --connect-timeout 30 --retry 3 --retry-delay 10 --compressed "https://unofficial-builds.nodejs.org/download/release/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz" \
 && tar -xJf "node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
 && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
 && apk add --no-cache --virtual .build-dependencies python2 make g++ \
 && npm install --production \
 && npm run test \
 && apk del curl && apk del .build-dependencies && rm -rf /var/cache/* /tmp/npm*
USER 1000
EXPOSE 8080
# EXPOSE 8765
CMD ["npm","start"]
