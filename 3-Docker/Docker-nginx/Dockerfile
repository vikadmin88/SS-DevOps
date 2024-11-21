FROM nginx:stable-alpine3.20-perl

COPY nginx.conf /etc/nginx/nginx.conf

VOLUME ["/usr/share/nginx/html"]

WORKDIR /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]