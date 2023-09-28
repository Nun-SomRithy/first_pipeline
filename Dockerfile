# Use the base Nginx image
FROM nginx:latest

# Copy the built React app to the Nginx document root
COPY build/ /usr/share/nginx/html

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
