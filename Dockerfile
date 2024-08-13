FROM node:22

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy tini libc++1

WORKDIR /app
RUN npm install workerd
COPY config.capnp hello.js ./

CMD ["tini", "./node_modules/.bin/workerd", "serve", "config.capnp"]
