#!/bin/bash

USERNAME=$(whoami)

echo "Running Entrypoint"

# Source the ROS setup script
source /opt/ros/iron/setup.bash
echo "source /opt/ros/iron/setup.bash" >> ~/.bashrc

# Change ownership of video devices to current user and
# set appropriate permissons
sudo chown $USERNAME:video /dev/video*
sudo chmod 660 /dev/video*

# Keep the container running
exec tail -f /dev/null