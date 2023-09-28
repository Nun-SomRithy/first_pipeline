
# Use the official Nginx image as the base image
FROM nginx:1.23.2

# Install sudo
RUN apt-get update && apt-get install -y sudo

# Configure sudo to allow Jenkins user to execute commands with root privileges
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy the built Next.js app from the previous stage
COPY --from=build /app/.next /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]
