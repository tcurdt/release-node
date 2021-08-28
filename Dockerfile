# install packages
FROM node:14-alpine as builder
RUN mkdir /work
WORKDIR /work
RUN apk add --no-cache alpine-sdk python
COPY package*.json ./
RUN mkdir -p node_modules && npm ci --only=production

# fresh image without dev packages
FROM node:14-alpine
ARG SHA
RUN mkdir /work
WORKDIR /work
COPY --from=builder /work/node_modules ./node_modules
RUN npm rebuild -q
ADD . .
RUN echo "{ \"sha\": \"$SHA\" }" > version.json
RUN cat version.json
# USER 1000
# EXPOSE 8080
CMD [ "node", "index.js" ]
