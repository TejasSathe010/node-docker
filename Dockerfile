# All the listed commands are called Layers

FROM node:latest

WORKDIR /app

COPY package.json .

# RUN - runs at build time
# RUN npm install
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
    then npm install; \
    else npm install --only=production; \
    fi

# Optimization technique (Why 2 copy commands) - Layer and caching (logic)
COPY . ./

ENV PORT 3000

EXPOSE $PORT

# CMD - runs at runtime
CMD [ "node", "index.js" ]

# Bind volume allows to sync code from local to docker container ([:ro] We can make it read only volume as well (Only local to docker and not vice versa)), There are many diff types of volumes

# docker run -v /Users/tejassathe/Programming/Docker/node-docker:/app -v /app/node_modules --env-file ./.env -p 3000:4000 -d --name node-app node-app-image

# docker rm node-app -fv
