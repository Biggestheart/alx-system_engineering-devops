#!/bin/bash

# Start Docker_container
docker run -p 8080:80 -d -it holbertonschool/265-0

# Check_container_status
container_id=$(docker ps -q)
if [ -z "$container_id" ]; then
    echo "Container failed to start."
    exit 1
fi

# Access_the_container shell
docker exec -it "$container_id" /bin/bash

# Inside_the_container, check if Apache is running
service apache2 status

# If Apache is_not running, start it
service apache2 start

# Navigate_to_the Apache document root
cd /var/www/html

# Create_an HTML file_with "Hello Holberton"
echo "Hello Holberton" > index.html

#Exit_the container_shell
exit
