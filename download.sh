SOURCEDIR=$1
I3VERSION=$2

if [ "$SOURCEDIR" == "" ]; then
    echo "SOURCEDIR is required"
    exit 1
fi

if [ "$I3VERSION" == "" ]; then
    echo "I3VERSION is required"
    exit 1
fi

cd $SOURCEDIR

if [ ! -e xcb-util-xrm-1.2 ]; then
    wget 'https://github.com/Airblader/xcb-util-xrm/releases/download/v1.2/xcb-util-xrm-1.2.tar.bz2'
    tar xf xcb-util-xrm-1.2.tar.bz2
    rm xcb-util-xrm-1.2.tar.bz2
else
    echo "xcb-util exists; skipping"
fi

if [ ! -e i3-${I3VERSION} ]; then
    wget http://i3wm.org/downloads/i3-${I3VERSION}.tar.bz2
    tar xf i3-${I3VERSION}.tar.bz2
    rm i3-${I3VERSION}.tar.bz2
else
    echo "i3 source exists; skipping"
fi
