FROM node:22

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy tini libc++1

WORKDIR /app
RUN npm install -g workerd
COPY config.capnp hello.js ./

CMD ["tini", "workerd", "serve", "config.capnp"]
