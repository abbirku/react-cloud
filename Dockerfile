FROM node:16.16.0-alpine3.16 AS builder
WORKDIR /my-app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
ENV PORT 3000
FROM nginx:1.23.1-alpine
WORKDIR /var/www/html
COPY --from=builder /my-app/build .
CMD ["nginx", "-g", "daemon off;"]