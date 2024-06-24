# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install Strapi dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port Strapi runs on (default is 1337)
EXPOSE 1337

# Start the Strapi application
CMD ["npm", "start"]
