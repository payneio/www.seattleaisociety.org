FROM nginx:alpine

# Copy website files from www directory to nginx html directory
COPY www/ /usr/share/nginx/html/

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]