# Use the latest Ubuntu LTS as the base image
FROM ubuntu:22.04

# Argument for username (passed from docker-compose.yml)
ARG USERNAME

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
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a user with the provided username only if it does not already exist
RUN if ! id -u ${USERNAME} >/dev/null 2>&1; then \
        useradd -m -s /bin/bash ${USERNAME} && \
        echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}; \
    fi

# Switch to the user by default
USER ${USERNAME}
WORKDIR /home/${USERNAME}

# Set the default command to run when the container starts
CMD ["/bin/bash"]
