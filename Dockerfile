# Stage 2: Create the final image with Nginx
FROM nginx:1.23.2

# Copy the built application from the builder stage to Nginx's HTML directory
COPY --from=build /app/build /usr/share/nginx/html/

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
