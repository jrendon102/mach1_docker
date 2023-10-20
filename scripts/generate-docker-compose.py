#!/usr/bin/env python3

"""
This script reads configuration values from a Docker configuration file, replaces placeholders in
template files, and generates Docker-related configuration files.

It helps create directories containing files used for Docker configurations with the provided values 
when building images.
"""
import os
import yaml

# Directories relative to this directory
CONFIG_DIR = "../config"
DOCKER_COMPOSE_DIR = "../docker_compose"
VOLUMES_DIR = "../volumes"

# Config files
DOCKER_CONFIG = os.path.join(CONFIG_DIR, "docker-config.yml")
DOCKER_COMPOSE_TEMPLATE = os.path.join(CONFIG_DIR, "docker-compose-template.yml")
HOST_VOLUME_TEMPLATE = os.path.join(CONFIG_DIR, "host-template.yml")


# Define a dictionary that helps generate directories containing files used for Docker configurations.
GENERATED_FILES = {
    DOCKER_COMPOSE_DIR: [DOCKER_COMPOSE_TEMPLATE, "docker-compose.yml"],
    VOLUMES_DIR: [HOST_VOLUME_TEMPLATE, "host"],
}

CONFIG_DATA = {
    "IMAGE_TAG": "",
    "CONTAINER_NAME": "",
    "CONTAINER_USER": "",
    "CONTAINER_HOSTNAME": "",
    "CONTAINER_LOOPBACK_IP": "",
    "CONTAINER_STATIC_IP": "",
    "CONTAINER_SUBNET": "",
    "REMOTE_HOSTNAME": "",
    "REMOTE_IP_ADDR": "",
}


def read_replace_write(
    docker_config: dict, dir_path: str, template_file: str, output_file_name: str
) -> None:
    """
    Generate a configuration file by reading a template file, replacing placeholders
    with values from docker_config, and saving the result to the specified directory.

    Args:
        docker_config (dict): A dictionary containing configuration values.

        dir_path (str): The directory where the generated file will be saved.

        template_file (str): The path to the template file to read.

        output_file_name (str): The name of the output file.

    Returns:
        None
    """
    with open(template_file, "r") as file:
        generated_file = file.read()

    for key, value in docker_config.items():
        generated_file = generated_file.replace(f"${{{key}}}", value)

    os.makedirs(dir_path, exist_ok=True)
    output_file = os.path.join(dir_path, output_file_name)
    with open(output_file, "w") as file:
        file.write(generated_file)


def create_docker_config() -> None:
    """
    Create a Docker configuration file if it doesn't exist and populate it with user-provided values.

    The configuration values are stored as plain strings in the YAML file.

    Returns:
        None
    """
    if os.path.exists(DOCKER_CONFIG):
        return

    for key in CONFIG_DATA:
        value = str(input(f"Enter value for {key}: "))
        CONFIG_DATA[key] = value

    with open(DOCKER_CONFIG, "w") as yaml_file:
        yaml.dump(CONFIG_DATA, yaml_file, default_flow_style=False)


if __name__ == "__main__":
    create_docker_config()

    with open(DOCKER_CONFIG, "r") as config_file:
        docker_config = yaml.safe_load(config_file)

    for dir, (template, file_name) in GENERATED_FILES.items():
        read_replace_write(docker_config, dir, template, file_name)
