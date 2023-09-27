# Define the base image using Alpine Linux as the parent image
FROM node:18-alpine

# Create and set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container first
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of your application code to the container
COPY . .

# Build the Next.js application (this step may differ based on your Next.js project structure)
RUN npm run build

# Define the command to start the application
CMD ["npm", "start"]
