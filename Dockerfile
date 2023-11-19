FROM node:14.21-alpine
WORKDIR /src
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3001
CMD [ "npm", "start" ]