FROM node:alpine
WORKDIR /usr/src/app
# Copy files or folders from source to the dest path in the image's filesystem.
COPY package.json /usr/src/app/
COPY . /usr/src/app/

# Execute any commands on top of the current image as a new layer and commit the results.
RUN npm install --production
EXPOSE 8081
ENTRYPOINT ["npm", "start"]