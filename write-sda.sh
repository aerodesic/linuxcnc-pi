#!/bin/bash
if [ -z $SDIMAGE_DEV ]; then
  DEV=$1
else
  DEV=${SDIMAGE_DEV}
fi

if [ -z ${DEV} ]; then
  echo DEV not defined
  exit 1
fi

if [ -z ${BUILDDIR} ]; then
  echo BUILDDIR not defined
  exit 1
fi

if [ ! -e ${DEV} ]; then
  echo No ${DEV}
  exit 1
fi

echo Writing to ${DEV}
sudo -K

if [ -e ${DEV}1 ]; then
  sudo umount ${DEV}1
fi

if [ -e ${DEV}2 ]; then
  sudo umount ${DEV}2
fi

if [ -e ${DEV}p1 ]; then
  sudo umount ${DEV}p1
fi

if [ -e ${DEV}p2 ]; then
  sudo umount ${DEV}p2
fi

if [ ! -f ${DEV} ]; then
  sudo dd if=${BUILDDIR}/tmp/deploy/images/raspberrypi3/rhpro-image-raspberrypi3.rpi-sdimg of=${DEV} bs=1M conv=noerror,sync
  sync
else
 echo "${DEV}" is a file.
fi
