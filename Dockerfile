FROM node:14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8081
EXPOSE 8080
CMD [ "node", "server.js" ]