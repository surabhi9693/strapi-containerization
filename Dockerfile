# Use an official Node runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Install PM2 globally
RUN npm install -g pm2

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Strapi and dependencies
RUN npm install

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Expose the port that Strapi runs on
EXPOSE 1337

# Run Strapi with PM2
CMD ["pm2-runtime", "start", "npm", "--", "start"]
