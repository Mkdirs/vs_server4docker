# VintageStory Server Docker

## Setup
This will build the docker image and run it
```shell
serverctl <version> <install_dir> <data_dir>
```

Accessing the container:
```shell
docker exec -it vsserver bash
```
## Updating the server:
In the container run
```shell
./updater <version>
```

In the server.sh set the variables:
``VSPATH=/vintagestory/server``
``VSDATA=/vintagestory/data``

> Note: in the serverconfig.json set Ip to 0.0.0.0