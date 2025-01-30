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
ARG VS_VERSION='1.20.3'
WORKDIR /vintagestory

COPY ./updater.sh ./

RUN apt-get install -y screen && \
apt-get install -y procps && \
chmod +x ./updater.sh && \
useradd vintagestory -s /sbin/nologin && \
./updater.sh ${VS_VERSION} ./server

VOLUME [ "/vintagestory/server", "/vintagestory/data" ]

EXPOSE 42420/tcp
EXPOSE 42420/udp

CMD ["/bin/bash"]