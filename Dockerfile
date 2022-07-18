FROM node:7 as node
WORKDIR /app
COPY package.json package-lock.json
RUN npm install
COPY . .
RUN npm run build --prod

#stage2
FROM nginx:alpine
COPY --from=node /app/dist/ziraat-personal /usr/share/nginx/html
