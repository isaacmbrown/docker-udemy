# tag this phase with name builder
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# phase 2
# FROM statement stops phase 1
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# default command of nginx image starts it for us