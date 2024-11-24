# CMD - runs at runtime
CMD [ "npm", "run", "dev" ]

# RUN - runs at build time
RUN npm install

# Optimization technique (Why 2 copy commands) - Layer and caching (logic)
COPY . ./

# Bind volume allows to sync code from local to docker container ([:ro] We can make it read only volume as well (Only local to docker and not vice versa)), There are many diff types of volumes

# docker run -v /Users/tejassathe/Programming/Docker/node-docker:/app -v /app/node_modules --env-file ./.env -p 3000:4000 -d --name node-app node-app-image

# docker rm node-app -fv (Deletes volumes associated with the image and container)

# A Config which is shared between dev and prod env.
# For dev - docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
# For prod - docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
