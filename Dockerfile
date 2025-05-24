# Use the latest Ubuntu image as the base
FROM ubuntu:latest

# Update and upgrade the system
RUN apt update && apt upgrade -y

# Install Python and pip
RUN apt install -y python3 python3-pip

# Install PyYAML
RUN pip3 install pyyaml

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the working directory
WORKDIR /app

# Copy the application code into the container
COPY . /app

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
