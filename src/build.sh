
set -e

if [ "$1" != "" ]; then
    I3VERSION="$1"
fi
if [ "$I3VERSION" == "" ]; then
    echo "No i3 Version is specified"
    exit 1
fi

# compile xcb-util
cd /tmp/xcb-util-xrm-1.2
./configure --prefix=/opt/xcb-util-xrm-1.2 && make && make install
cd /tmp/i3-${I3VERSION}

# compile i3
autoreconf -fiv
export LD_RUN_PATH=/opt/xcb-util-xrm-1.2/lib:$LD_RUN_PATH
XCB_UTIL_XRM_CFLAGS='-I/opt/xcb-util-xrm-1.2/include -L/opt/xcb-util-xrm-1.2/lib' \
    XCB_UTIL_XRM_LIBS=/opt/xcb-util-xrm-1.2/lib/libxcb-xrm.so \
    ./configure --prefix=$PREFIX
cd x86_64-pc-linux-gnu
make clean && make -j2 && make install

# create the run script
echo 'PATH=$PATH:/opt/i3/bin i3' > $PREFIX/bin/start-i3
chmod +x $PREFIX/bin/start-i3
