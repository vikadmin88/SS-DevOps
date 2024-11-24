FROM node:18 AS builder

WORKDIR /app

# ARG REPO_URL=https://github.com/vikadmin88/sstest.git
ARG REPO_URL
RUN git clone $REPO_URL .
COPY .env .

RUN npm install
RUN npm run build

FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html/

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]