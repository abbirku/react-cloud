FROM node:16.16.0-alpine3.15
RUN addgroup app && adduser -S -G app app
USER app