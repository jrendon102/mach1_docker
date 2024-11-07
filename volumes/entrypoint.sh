#!/bin/bash

echo "Running Entrypoint"

# Source the ROS setup script abd append the source
# command to .bashrc for future terminal sessions
source /opt/ros/iron/setup.bash
echo "source /opt/ros/iron/setup.bash" >> ~/.bashrc

# Change ownership of video devices to the current user 
# and set appropriate permissions
USERNAME=$(whoami)
sudo chown $USERNAME:video /dev/video*
sudo chmod 660 /dev/video*

# Create a .Xauthority file if it doesn't exist
touch /home/$USERNAME/.Xauthority

# Add the X11 authentication cookie to the .Xauthority file
xauth add "$DISPLAY" "$XAUTH_PROTOCOL" "$XAUTH_KEY"

# Keep the container running indefinitely
exec tail -f /dev/null