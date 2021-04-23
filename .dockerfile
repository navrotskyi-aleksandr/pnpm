FROM node:14
RUN curl -f https://get.pnpm.io/v6.js | node - add --global pnpm
# pnpm fetch does require only lockfile
COPY pnpm-lock.yaml ./
RUN pnpm fetch --prod
ADD . ./
RUN pnpm install -r --offline --prod
# Bundle app source
COPY . .
EXPOSE 8080
CMD [ "node", "server.js" ]