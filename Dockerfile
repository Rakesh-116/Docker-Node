FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs 
# Installing Nodejs is done with above commands

# COPY SOURCE DESTINATION
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY main.js index.js
# In above command, main.js is source and that will be copied to index.js in the container (we can give same name or any other name for destination files w.r.t source files)

RUN npm install

ENTRYPOINT [ "node", "index.js" ]
# In container it runs the index.js file since we copied the main.js to index.js
