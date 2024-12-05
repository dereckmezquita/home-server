FROM ubuntu:22.04

ARG USERNAME
ARG PORT
ARG PASSWORD

ENV USERNAME=${USERNAME}
ENV PORT=${PORT}
ENV PASSWORD=${PASSWORD}
ENV HOME=/home/${USERNAME}

WORKDIR /workspace

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    curl \
    wget \
    git \
    vim \
    sudo \
    net-tools \
    nano \
    zsh \
    openssl \
    && rm -rf /var/lib/apt/lists/*

RUN if ! id -u ${USERNAME} >/dev/null 2>&1; then \
        useradd -m -s /bin/bash ${USERNAME} && \
        echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}; \
    fi && \
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

RUN mkdir -p /etc/code-server && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/code-server/self-signed.key \
    -out /etc/code-server/self-signed.crt \
    -subj "/CN=localhost"

USER ${USERNAME}
WORKDIR /home/${USERNAME}

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN mkdir -p ~/.config/code-server && \
    echo "bind-addr: 0.0.0.0:${PORT}" > ~/.config/code-server/config.yaml && \
    echo "auth: password" >> ~/.config/code-server/config.yaml && \
    echo "password: ${PASSWORD}" >> ~/.config/code-server/config.yaml && \
    echo "cert: /etc/code-server/self-signed.crt" >> ~/.config/code-server/config.yaml && \
    echo "cert-key: /etc/code-server/self-signed.key" >> ~/.config/code-server/config.yaml

ENTRYPOINT code-server --bind-addr 0.0.0.0:${PORT} --user-data-dir /home/${USERNAME}/.local/share/code-server

EXPOSE ${PORT}
