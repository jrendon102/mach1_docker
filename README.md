# machx_docker

## Overview
[![License](https://img.shields.io/badge/license-GNU%20GPL-blue.svg)](LICENSE)

The **machx_docker** repository contains the necessary Docker configuration files and scripts for setting up Docker containers. These Docker containers facilitate the deployment of various components of the robot's software stack, ensuring portability and ease of use across different environments.

## Contents
This repository includes the following components:

- `.env.example`: A template for a environment varibale configuration file. This template includes placeholders for configuration values that can be customized to match your specific deployment requirements.

- `launch_robot.sh`: A script to initialize and start the robotics environment using Docker Compose. It handles tasks such as setting up environment variables, starting Docker containers, and ensuring proper permissions for X11 forwarding.

- `docker-compose.yml`: The Docker Compose configuration file used to define and manage the Docker containers required for the robotics environment.

- `Dockerfile`: The Dockerfile used to build the custom Docker image for the robotics system, containing the necessary dependencies and configurations.

- `docker/`: A directory containing Docker-related files, including the Dockerfile used to build the project's Docker image.

- `docker_compose/`: A directory containing the Docker Compose YAML file (docker-compose.yml).

- `config/`: A directory containing configuration files for the robotics system, which can be customized based on the deployment environment.

- `volumes/`: A directory for Docker volumes, which persists data across container restarts.

## Usage
This project includes several components for building and running your robot using Docker. Below is a guide to using the provided scripts and Docker configurations.

1. ### Environment Setup 
   Before starting, ensure that your environment variables are set correctly. You can customize these variables in the `.env.example` file. This file serves as a template for your environment configuration, with placeholders that need to be replaced by your actual values.

   To use it:
   ```bash
   cp ./config/.env.example ./config/.env 
   ```
   Then, modify the .env file to match your system or deployment requirements.

2. ### Running the Docker Container
   You can run the Docker container using the launch_robot.sh script.
   - Make sure your Docker Compose configuration is ready. The `docker-compose.yml` file is located in the `docker_compose/` directory.
   - Start the container:
   ```bash
   .launch_robot.sh
   ```

## License
This repository is released under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.

## Author & Maintainer
This Docker configuration project is authored and maintained by me, Julian A Rendon. If you have questions, require support, or need further information about the repository, you can reach out to me via (julianrendon514@gmail.com).
