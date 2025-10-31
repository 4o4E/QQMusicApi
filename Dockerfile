FROM node:24.11.0

USER root

WORKDIR /home/qqmusic

COPY . .

VOLUME ["./data","./bin"]

RUN yarn config set "strict-ssl" false -g
RUN yarn config set registry https://registry.npmmirror.com
RUN sed -i 's/registry.nlark.com/registry.npm.taobao.org/g' ./yarn.lock
RUN yarn install
RUN yarn global add cross-env

EXPOSE 80

CMD ["cross-env","PORT=80","node","/home/qqmusic/bin/www"]
