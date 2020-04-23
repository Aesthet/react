FROM node:alpine as builder

WORKDIR /app

RUN npm install -g create-react-app

RUN create-react-app frontend

WORKDIR /app/frontend

RUN npm install

RUN ["npm", "run", "build"]

FROM nginx:alpine

COPY --from=builder /app/frontend/build /usr/share/nginx/html
