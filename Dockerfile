FROM node:14.14.0-alpine

ENV CI=true

WORKDIR /svelte-timers-tab
COPY package*.json ./
RUN npm i
COPY ./ ./

EXPOSE 5000
CMD [ "npm", "run", "dev" ]