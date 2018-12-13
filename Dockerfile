FROM node:lts

WORKDIR /usr/src

RUN mkdir webpack-demo

WORKDIR /usr/src/webpack-demo

COPY package.json .

RUN npm install

RUN mkdir src

COPY ./prod ./src

RUN mkdir src/nginx_folder

RUN npm run build
