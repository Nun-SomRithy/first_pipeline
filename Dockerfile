
# Stage 2: Create the final image with Nginx
FROM nginx:1.23.2
COPY --from=build /app/out /usr/share/nginx/html

# Copy Nginx configuration if needed
# COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
