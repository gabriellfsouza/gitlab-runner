FROM ubuntu:jammy

RUN apt update
RUN apt install curl git -y

RUN curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
RUN bash /tmp/nodesource_setup.sh
RUN apt install nodejs -y

RUN groupadd --gid 1000 node && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

USER node
WORKDIR /home/node
RUN git clone https://github.com/IBM/node-hello-world
WORKDIR /home/node/node-hello-world

RUN npm install

CMD npm start

EXPOSE 8080