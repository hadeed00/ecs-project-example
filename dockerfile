FROM node:18 AS builder

WORKDIR /app

COPY ./app/ .

RUN corepack enable && yarn set version stable

RUN yarn install

RUN yarn build

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/build /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
