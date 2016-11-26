#
set -e

if [ "$1" != "" ]; then
    I3VERSION="$1"
fi
if [ "$I3VERSION" == "" ]; then
    echo "No i3 Version is specified"
    exit 1
fi
cd /tmp
wget https://github.com/Airblader/xcb-util-xrm/releases/download/v1.2/xcb-util-xrm-1.2.tar.bz2
tar xf xcb-util-xrm-1.2.tar.bz2
cd xcb-util-xrm-1.2
./configure --prefix=/opt/xcb-util-xrm-1.2 && make && make install
cd /tmp
wget http://i3wm.org/downloads/i3-$I3VERSION.tar.bz2 -O i3.tar.bz2
tar xf i3.tar.bz2
cd /tmp/i3-$I3VERSION
export LD_RUN_PATH=/opt/xcb-util-xrm-1.2/lib:$LD_RUN_PATH
XCB_UTIL_XRM_CFLAGS='-I/opt/xcb-util-xrm-1.2/include -L/opt/xcb-util-xrm-1.2/lib' \
    XCB_UTIL_XRM_LIBS=/opt/xcb-util-xrm-1.2/lib/libxcb-xrm.so \
    ./configure --prefix=$PREFIX
cd x86_64-pc-linux-gnu
make -j2
make install
