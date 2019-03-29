#!/bin/bash
POKY_VERSION=rocko

git clone -b ${POKY_VERSION} git://git.yoctoproject.org/poky.git poky
cd poky
git clone -b ${POKY_VERSION} git://git.openembedded.org/meta-openembedded
git clone -b ${POKY_VERSION} https://github.com/meta-qt5/meta-qt5
git clone -b ${POKY_VERSION} git://git.yoctoproject.org/meta-security
git clone -b ${POKY_VERSION} git://git.yoctoproject.org/meta-raspberrypi
cd ..
git clone https://github.com/jumpnow/meta-rpi.git
git clone ssh://git@github.com/IMT-CPAC/meta-aoextra.git
git clone ssh://git@github.com/IMT-CPAC/meta-package-signing.git
git clone ssh://git@github.com/IMT-CPAC/meta-linuxcnc.git
git clone https://github.com/intel/luv-yocto.git
# git clone https://github.com/Igalia/meta-webkit.git
git clone https://github.com/rossburton/meta-printing.git

sed -i s:^SRCROOT.*:SRCROOT\ =\ \"`pwd`\": linuxcnc-pi/conf/bblayers.conf

