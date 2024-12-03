FROM codercom/code-server:latest

# Accept build arguments for user customization
ARG USERNAME=dereck
ARG USER_UID=1000
ARG USER_GID=1000

# Install sudo and other utilities
USER root
RUN apt-get update && \
    apt-get install -y sudo && \
    rm -rf /var/lib/apt/lists/*

# Remove default coder user
RUN userdel -r coder || true

# Create user group and user
RUN groupadd -g ${USER_GID} ${USERNAME} && \
    useradd -m -u ${USER_UID} -g ${USERNAME} -s /bin/bash ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Create and set permissions for config directory
RUN mkdir -p /config && \
    chown -R ${USERNAME}:${USERNAME} /config

# Set environment variables
ENV USER=${USERNAME}
ENV HOME=/home/${USERNAME}

# Set working directory
WORKDIR /home/${USERNAME}

# Switch to user
USER ${USERNAME}

# Expose port
EXPOSE 8443

# Start code-server
ENTRYPOINT ["/usr/bin/code-server", "--bind-addr", "0.0.0.0:8443", "--user-data-dir", "/config", "--auth", "password"]