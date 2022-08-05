FROM node:16.16.0-alpine3.15
WORKDIR /my-app
COPY package*.json .
RUN npm install
COPY . .
EXPOSE 3000
ENV PORT 3000
CMD npm start