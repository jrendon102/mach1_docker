# machx_docker

## Overview
[![License](https://img.shields.io/badge/license-GNU%20GPL-blue.svg)](LICENSE)

The **machx_docker** repository contains the necessary Docker configuration files and scripts for setting up Docker containers. These Docker containers facilitate the deployment of various components of the robot's software stack, ensuring portability and ease of use across different environments.

## Contents
This repository includes the following components:

- `docker-compose-template.yml`: A template for a Docker Compose configuration file. This template includes placeholders for configuration values that can be customized to match your specific deployment requirements.

- `docker-config.yml`: A YAML configuration file that stores the values for the placeholders in the `docker-compose-template.yml`. This file allows you to specify parameters such as container names, user names, IP addresses, and more.

- `generate-docker-compose.py`: A Python script that reads the `docker-config.yml` file, replaces the placeholders in the `docker-compose-template.yml` with the provided values, and generates the final Docker Compose file (`docker-compose.yml`) ready for use.

## Usage
To create a Docker Compose file and set up the Docker containers:

1. Modify the values in the `docker-config.yml` file, located in the `config` directory, to match your deployment requirements.

2. Run the `generate-docker-compose.py` script, available in the `scripts` directory. This script uses the values from the `docker-config.yml` file to replace placeholders in the `*.template.yml` files located in the `config` directory.

3. The script generates new directories to facilitate the Docker setup, including:

   - `docker_compose`: This directory contains Docker Compose files.
   - `volumes`: It is reserved for storing associated volumes and configurations.

4. Deploy the Docker container using the generated `docker-compose.yml` file with the command `docker-compose up -d`. The Docker container will be configured as specified in the `docker-compose.yml` file.

## License
This repository is released under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.

## Author & Maintainer
This Docker configuration project is authored and maintained by me, Julian A Rendon. If you have questions, require support, or need further information about the repository, you can reach out to me via (julianrendon514@gmail.com).
