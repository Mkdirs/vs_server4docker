FROM ubuntu:24.04

# Setup environment for dotnet
RUN apt-get update && \
apt-get install -y wget && \
apt-get install -y software-properties-common && \
add-apt-repository ppa:dotnet/backports && \
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb &&\
dpkg -i packages-microsoft-prod.deb && \
rm packages-microsoft-prod.deb && \
apt-get update && \
apt-get install -y dotnet7


# Setup environment for vintagestory
WORKDIR /vintagestory

COPY updater ./

RUN apt-get install -y screen && \
apt-get install -y procps && \
chmod +x ./updater && \
useradd vintagestory -s /sbin/nologin

VOLUME [ "/vintagestory/server", "/vintagestory/data" ]

EXPOSE 42420/tcp
EXPOSE 42420/udp

CMD ["/bin/bash"]