# Use the latest Ubuntu LTS as the base image
FROM ubuntu:22.04

# Set the working directory
WORKDIR /workspace

# Update package lists and install desired packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    curl \
    wget \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Set the default command to run when the container starts
CMD ["/bin/bash"]
