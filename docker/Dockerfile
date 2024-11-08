FROM ros:iron-ros-base

# Update package list and install general dependencies
RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    libopencv-dev \
    net-tools \
    python3-opencv \
    python3-pip \
    sudo \
    tree \
    v4l-utils \ 
    vim \
    wget \
    xauth \
    x11-apps && \
    rm -rf /var/lib/apt/lists/*

# Update rosdep and install ROS and ROS-related packages
RUN apt-get update && \
    apt-get install -y \
    ros-iron-cv-bridge &&\
    rosdep update && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install gpiozero

# Create non-root user
ARG USERNAME=rpi
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config

# Set up sudo for non-root user
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Switch to non-root user
USER $USERNAME
WORKDIR /home/$USERNAME