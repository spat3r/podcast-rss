# Use the latest Ubuntu image as the base
FROM ubuntu:latest

# Update and upgrade the system
# Install python3-full to use pip to install packages system-wide
RUN apt update && apt upgrade -y

# Install Python and pip
RUN apt install -y python3-full git

# Create a virtual environment
RUN python3 -m venv /app/venv

# Activate the virtual environment
ENV PATH="/app/venv/bin:$PATH"

# Install PyYAML
RUN pip install pyyaml

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
