# Use an official Node.js runtime as the base image
FROM node:18.10

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

RUN rm -rf package-lock.json

# Install project dependencies
RUN npm install -g @angular/cli && npm install

# Copy the rest of the application source code to the container
COPY . .

# Expose the port the app runs on
EXPOSE 4200

# Start the Angular application
CMD ["ng", "serve", "--host", "0.0.0.0"]
