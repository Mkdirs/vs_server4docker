#!/bin/bash

if [ $# -ne 2 ]; then
        echo "Erreur! syntaxe: updater <version> <install_dir>"
        exit 1
fi

VERSION=$1
INSTALL_DIR=$2
FILE="vs_server_linux-x64_${VERSION}.tar.gz"
DOWNLOAD_URL="https://cdn.vintagestory.at/gamefiles/stable/${FILE}"

SAVED_SERVER_SH=false

stop_server() {
        echo "Stopping server..."
        $INSTALL_DIR/server.sh stop
}

start_server() {
        echo "Starting server..."
        $INSTALL_DIR/server.sh start
}

download() {
        echo "Downloading version ${VERSION}..."
        wget $DOWNLOAD_URL
}

unzip(){
        echo "Unzipping files..."
        tar -zvxf $FILE -C $INSTALL_DIR
        rm $FILE
}

clean(){
        echo "Cleaning installation directory..."
        cp $INSTALL_DIR/server.sh ./server.sh
        SAVED_SERVER_SH=true
        rm -rf $INSTALL_DIR/*
}

download

if [ -e "${INSTALL_DIR}/server.sh" ]; then
        echo "Found previous installation"
        stop_server
        clean
else
        echo "No previous installation found"

        if [ ! -d $INSTALL_DIR ]; then
                mkdir $INSTALL_DIR
        fi
fi

unzip

#if [ $SAVED_SERVER_SH = true ]; then
#       cp ./server.sh $INSTALL_DIR/server.sh
#fi

#start_server