FROM ubuntu:23.04

RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN npm install -g https-server

WORKDIR /usr/apps/hello-world/

CMD ["https-server", "-p", "8080"]
