#!/bin/bash

echo "Running Entrypoint"
source /opt/ros/iron/setup.bash
echo "source /opt/ros/iron/setup.bash" >> ~/.bashrc

# Keep the container running
exec tail -f /dev/null