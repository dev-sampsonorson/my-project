FROM node:latest

LABEL author="Sampson Orson Jackson"

ENV NODE_ENV=production PORT=3000

COPY . /var/www
WORKDIR /var/www

RUN npm install

# Maps/links/contain to? the source code in /var/www 
# This is not the source code in "docker host"/"host machine"
VOLUME ["/var/www"]

EXPOSE $PORT

ENTRYPOINT ["npm", "start"]


docker image build -t sampsonorson/play-express-site:1.0.0 .   
docker container run -p 7766:3000 -v ${PWD}:/var/www 19f10ecfa24b






FROM node:11.15.0-alpine as build-step
LABEL author="Sampson Orson Jackson"
ENV NODE_ENV=development PORT=3000
WORKDIR /var/www
COPY package.json ./
RUN npm install
COPY . .
EXPOSE $PORT
CMD npm run start