FROM alpine:3.12

# ENV NODE_VERSION 12.18.3

WORKDIR /app
ADD . .
ENV NPM_CONFIG_LOGLEVEL warn
RUN apk update && apk upgrade \
  && apk add --no-cache ca-certificates \
  && apk add --no-cache nodejs-npm \
# set -eu; \
# curl -fsSLO --compressed "https://unofficial-builds.nodejs.org/download/release/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz"; \
# echo "$CHECKSUM  node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz" | sha256sum -c - \
#   && tar -xJf "node-v$NODE_VERSION-linux-$ARCH-musl.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
#   && ln -s /usr/local/bin/node /usr/local/bin/nodejs; \
  && apk add --no-cache --virtual .build-dependencies python2 make g++ \
  && npm install --production \
  && npm run test \
  && apk del .build-dependencies && rm -rf /var/cache/* /tmp/npm*
USER 1000
EXPOSE 8080
# EXPOSE 8765
CMD ["npm","start"]