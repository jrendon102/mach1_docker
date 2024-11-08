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

MACHX_CODE_DIR="/home/$USERNAME/machx_code"
if [ -d "$MACHX_CODE_DIR" ]; then
    echo "Navigating to ROS workspace at $MACHX_CODE_DIR"
    cd "$MACHX_CODE_DIR"

    echo "Building ROS workspace"
    colcon build

    source "$MACHX_CODE_DIR/install/setup.bash"
    echo "source $MACHX_CODE_DIR/install/setup.bash" >> ~/.bashrc
else
    echo "ROS workspace directory not found at $MACHX_CODE_DIR"
fi

# Keep the container running indefinitely
exec tail -f /dev/null