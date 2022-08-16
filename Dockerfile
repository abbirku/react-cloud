FROM node:16.16.0-alpine3.16 AS builder
WORKDIR /my-app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
FROM nginx:stable-alpine
COPY --from=builder /my-app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]