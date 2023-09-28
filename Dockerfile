
# Use the official Nginx image as the base image
FROM nginx:1.23.2

# Copy the built Next.js app from the previous stage
COPY --from=build /app/.next /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx and keep it running in the foreground
CMD ["nginx", "-g", "daemon off;"]

