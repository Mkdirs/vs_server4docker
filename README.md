# VintageStory Server Docker

# How To Start

Build the image
``$ docker build -t vsserver [--build-arg VS_VERSION='<version>'] .``

Starting the container
``$ docker run -v /path/to/data:/vintagestory/data -v /path/to/server:/vintagestory/server -dt --name vsserver vsserver``

Accessing the container:
``$docker exec -it vsserver bash``