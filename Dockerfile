FROM node:lts

WORKDIR /usr/src/webpack-demo

COPY package.json .

RUN npm install

RUN mkdir src \
 && mkdir src/src \
 && mkdir src/dist

COPY ./prod/webpack.config.js ./src

COPY ./webpack-demo/src ./src/src

RUN npm run build
