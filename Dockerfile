# base image
FROM node:14.17

# set working directory
WORKDIR /app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json ./

RUN npm install --global yarn --force
RUN yarn

# add app
COPY . ./

# start app
CMD ["yarn", "start"]