FROM node:16.16.0-alpine3.16 AS builder
WORKDIR /my-app
COPY . .
RUN yarn build
FROM nginx:1.23.1-alpine
WORKDIR /usr/share/nginx/html
COPY --from=builder /my-app/build .
CMD ["nginx", "-g", "daemon off;"]