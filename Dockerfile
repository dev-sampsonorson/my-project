FROM node:latest

LABEL author="Sampson Orson Jackson"

ENV NODE_ENV=development PORT=3000

COPY . /var/www
WORKDIR /var/www

RUN npm install

# Maps/links/contain to? the source code in /var/www 
# This is not the source code in "docker host"/"host machine"

# In Dockerfile you can specify only the destination of a volume 
# inside a container. e.g. /usr/src/app.

# When you run a container, e.g. docker run --volume=/opt:/usr/src/app my_image, 
# you may but do not have to specify its mounting point (/opt) on the host machine. 
# If you do not specify --volume argument then the mount point will be chosen 
# automatically, usually under /var/lib/docker/volumes/.
VOLUME ["/var/www"]

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]