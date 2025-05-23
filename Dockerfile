# Use nginx as the base image for serving static content
FROM nginx:alpine

# Copy configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the website files to the nginx html directory
COPY . /usr/share/nginx/html/

# Remove the Dockerfile and nginx.conf from the final image to keep it clean
# Use -f flag to avoid errors if files don't exist
RUN rm -f /usr/share/nginx/html/Dockerfile && \
    rm -f /usr/share/nginx/html/nginx.conf && \
    rm -rf /usr/share/nginx/html/.git 2>/dev/null || true

# Expose port 80
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]