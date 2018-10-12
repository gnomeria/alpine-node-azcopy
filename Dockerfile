FROM microsoft/dotnet:2.1-runtime-alpine

ENV VERSION=v8.11.2 NPM_VERSION=5 YARN_VERSION=latest

RUN apk update
RUN apk upgrade
RUN apk add rsync && apk add wget && apk add bash
RUN apk add --update nodejs

RUN npm --version
RUN npm i -g yarn

RUN mkdir -p /var/lib/azcopy
WORKDIR /var/lib/azcopy

RUN wget -O azcopy.tar.gz https://aka.ms/downloadazcopyprlinux
RUN tar -xf azcopy.tar.gz
RUN chmod 0755 install.sh
RUN ./install.sh

CMD [ "azcopy --version" ]