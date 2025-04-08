FROM ubuntu:22.04

# Set non-interactive mode to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

# Set working directory
WORKDIR /home/vesc

# Install required packages and tools
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y git build-essential libgl-dev libxcb-xinerama0 wget git-gui stlink-tools openocd cmake gdb-arm-none-eabi

# Set Python 3 as default
RUN ln -s /usr/bin/python3 /usr/bin/python

# Install VESC firmware dependencies
# RUN git clone https://github.com/PsycheAero/vesc.git && \
#     cd vesc && \
#     make arm_sdk_install

# Clean up to reduce image size and remove unnecessary package lists
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
