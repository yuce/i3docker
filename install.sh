#! /bin/bash

set -e

if [ "$1" == "" ]; then
    echo "Using default SOURCEDIR"
    make build && make install
else
    echo "Using SOURCEDIR=$1"
    make build SOURCEDIR="$1" && make install SOURCEDIR="$1"
fi
sudo cp ./i3.desktop /usr/share/xsessions/i3.desktop
sudo rm /opt/i3 && sudo ln -s /opt/i3-4.13 /opt/i3
