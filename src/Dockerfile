FROM node:16.16.0-alpine3.15
RUN add group app && add user -S -G app app
USER app
WORKDIR /react-cloud
COPY . . 
RUN npm install