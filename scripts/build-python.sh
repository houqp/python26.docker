#!/bin/bash

cd python

LDFLAGS=-L/usr/lib/x86_64-linux-gnu \
./configure --prefix=/usr --enable-shared --with-system-ffi \
			--enable-unicode=ucs4
make
make altinstall

# echo '/usr/lib' > /etc/ld.so.conf.d/python-2.6.conf
# ldconfig

ln -s /usr/bin/python2.6 /usr/bin/python

# install setuptools
cd ../setuptools
python2.6 setup.py install

# install pip
curl https://bootstrap.pypa.io/get-pip.py | python2.6
