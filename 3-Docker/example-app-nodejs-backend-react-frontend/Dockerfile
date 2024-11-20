FROM node:hydrogen-alpine3.20

WORKDIR /app

COPY package.json package-lock.json webpack.config.js ./
RUN npm install

COPY . .
RUN npm run build

COPY static ./static

EXPOSE 3000

CMD ["node", "./src/server/app.js"]