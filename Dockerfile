FROM nginx:alpine

# Default nginx page hatao
RUN rm -rf /usr/share/nginx/html/*

# Apni files copy karo
COPY index.html /usr/share/nginx/html/index.html

# Port 80 expose karo
EXPOSE 80

# Nginx start karo
CMD ["nginx", "-g", "daemon off;"]
