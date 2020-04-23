FROM node:alpine as builder

WORKDIR /app

RUN npm install -g create-react-app

RUN create-react-app reactapp

WORKDIR /app/reactapp

RUN npm install

RUN ["npm", "run", "build"]

FROM nginx
EXPOSE 80
COPY --from=builder /app/frontend/build /usr/share/nginx/html
