# Use an official Node.js runtime as the base image
FROM node:16
# Set the working directory inside the container
WORKDIR /usr/src/app
# Copy package.json and package-lock.json
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy the entire application source code
COPY . .
# Expose the application port
EXPOSE 3000
# Command to run the app
CMD ["npm", "start"]