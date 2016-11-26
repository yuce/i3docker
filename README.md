# Docker Builder for i3 Window Manager

Builds and installs i3 window manager version 4.13.

## Requirements

- Docker (version 1.12.1 on Ubuntu 16.04 repositories works just fine)
- Tested only on Ubuntu 16.04, should work on any reasonably modern Linux system just fine.

## Usage:

Run `bash install.sh`. `xcb-util-xrm` will be installed at `/opt/xcb-util-xrm-1.2` and i3 at `/opt/i3-4.13`. A symlink will be created at `/opt/i3`. `i3.desktop` will be copied to `/usr/share/xsessions/`
