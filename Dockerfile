# Use a lightweight Nginx web server image
FROM nginx:alpine

# Copy all static website files from the local folder to the Nginx html directory
COPY . /usr/share/nginx/html/

# Expose port 80 to access the website
EXPOSE 80
