#install boost >= 1.48
sudo aptitude install libboost1.48-all-dev
#python visualizer
sudo apt-get install python-dev python-pygraphviz python-kiwi python-pygoocanvas python-gnome2 python-gnomedesktop python-rsvg ipython
#extra package for install
sudo aptitude install python-pygccxml libsqlite3-dev  libgsl0-dev
#begin to install ndnSIM
mkdir ndnSIM
cd ndnSIM
git clone git://github.com/cawka/ns-3-dev-ndnSIM.git ns-3
git clone git://github.com/cawka/pybindgen.git pybindgen
git clone git://github.com/NDN-Routing/ndnSIM.git ns-3/src/ndnSIM

# Build and install NS-3 and ndnSIM
cd ns-3
./waf configure -d optimized
./waf

sudo ./waf install
cd ..

git clone git://github.com/cawka/ndnSIM-scenario-template.git scenario
cd scenario
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

./waf configure
./waf --run ndn-grid --vis
