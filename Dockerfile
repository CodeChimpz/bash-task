FROM node:18-alpine
WORKDIR /usr/src/app
COPY package*.json ./

RUN npm install
COPY . .
RUN apk update && apk add bash
RUN apk add mysql mysql-client
CMD ["bash","check-launch.bash"]