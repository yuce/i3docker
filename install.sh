#! /bin/bash

set -e

make build
make install
sudo cp ./i3.desktop /usr/share/xsessions/i3.desktop
sudo rm /opt/i3 && sudo ln -s /opt/i3-4.13 /opt/i3
