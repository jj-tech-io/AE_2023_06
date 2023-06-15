# AE_2023_06
Autoencoder used for manipulating human skin characteristics in real-time.

## Table of Contents
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Cloning the Repository](#cloning-the-repository)
- [Running the Project](#running-the-project)
- [Making Changes](#making-changes)
- [Docker Commands](#docker-commands)
- [Built With](#built-with)
- [Contributing](#contributing)

## Getting Started
To run this project, you'll need to install Docker on your machine. Follow the instructions on the [Docker Website](https://docs.docker.com/desktop/install/windows-install/) to download and install Docker.


## Prerequisites
To run this project, you'll need to install Docker on your machine. Follow the instructions on the Docker website to download and install Docker.

## Cloning the Repository
To get a local copy of the repository, simply run:
git clone https://github.com/username/repository.git
Replace `username` and `repository.git` with the actual username and repository name.

## Running the Project
Once Docker is installed and the repository is cloned, navigate to the root directory of the project and run the following command to build and start the Docker container:
docker-compose up --build

This command will build a Docker image from the Dockerfile in the project and then start a container from this image. The `-d` flag will run the container in detached mode, allowing you to use the command prompt for other commands.

To stop the Docker container, run:
docker-compose down

## Making Changes
The project comes with Jupyter notebook files that are set up to auto-reload any changes you make to the Python scripts. To start making changes to the project:

1. Open the Jupyter notebook file (.ipynb) you want to edit.
2. Make the necessary changes in the code cells.
3. Click `File > Save and Checkpoint` to save your changes.

Remember to build and run the Docker container again to see the changes in effect.

## Docker Commands
Here are some useful Docker commands:

- `docker-compose up --build`: Build and start the container.
- `docker-compose down`: Stop the container.
- `docker ps`: List running containers.
- `docker exec -it <container_id> /bin/bash`: Open a bash shell inside a running container.
- `docker-compose build --no-cache`: Build the image without using cached layers.

## Built With
- [Docker](https://www.docker.com/) - The container platform used.
- [TensorFlow](https://www.tensorflow.org/) - The machine learning framework used.

## Contributing
If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are warmly welcomed. 

For any major changes, please open an issue first to discuss what you would like to change. Your contributions are appreciated and please remember to give proper attribution. 

## If you use the code or parts of this project in your research, kindly cite:
@misc{johnson2023_AE_2023_06,
author = {Johnson, Joel},
title = {AE_2023_06 Project},
year = {2023},
publisher = {GitHub},
journal = {GitHub Repository},
howpublished = {\url{https://github.com/username/repository}}
}
