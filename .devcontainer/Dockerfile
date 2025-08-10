# Use official Bun image as base
FROM oven/bun:1.1.44-debian

# Install system dependencies needed for development
RUN apt-get update && apt-get install -y \
    # Basic utilities
    curl \
    wget \
    git \
    ca-certificates \
    gnupg \
    lsb-release \
    # Build tools that may be needed for native modules
    build-essential \
    python3 \
    # Additional tools for agents
    jq \
    # Cleanup
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (LTS) for compatibility with tools that need it
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs

# Install global tools that agents might need
RUN npm install -g \
    typescript \
    turbo \
    @biomejs/biome \
    prettier \
    markdownlint-cli2 \
    stylelint

# Create non-root user for development
ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Update the user to match host UID/GID if needed
RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then \
        groupmod --gid $USER_GID $USERNAME \
        && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
        && chown -R $USER_UID:$USER_GID /home/$USERNAME; \
    fi

# Setup workspace directory
WORKDIR /workspace
RUN chown -R $USERNAME:$USERNAME /workspace

# Switch to non-root user
USER $USERNAME

# Configure bun for the user
RUN bun --version

# Set up shell environment
RUN echo 'export PATH="$HOME/.bun/bin:$PATH"' >> ~/.bashrc \
    && echo 'alias ll="ls -la"' >> ~/.bashrc \
    && echo 'alias la="ls -A"' >> ~/.bashrc \
    && echo 'alias l="ls -CF"' >> ~/.bashrc

# Expose common ports for web development
EXPOSE 3000 3001 3002 4173 5173 8080

# Default command
CMD ["bash"]