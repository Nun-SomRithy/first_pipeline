# Stage 1: Build the Node.js application
FROM node:18-alpine AS builder

# Create and set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container first
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of your application code to the container
COPY . .

# Build the Next.js application
RUN npm run build

# Stage 2: Create the final image with Nginx
FROM nginx:1.23.2

# Copy the built application from the builder stage to Nginx's HTML directory
COPY --from=builder /app/ /usr/share/nginx/html/

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
