#!/bin/sh

# exclude these files from creating links
EXCLUDE="^.git|^README|^INSTALL|^LICENSE|^install.sh|^\.$"

usage() {
  echo "Please run this script from 'lora-root' directory!"
  echo "Usage:  ./bin/install.sh"
}

pwd=`pwd`
if [ `basename ${pwd}` != 'lora-root' ] ; then
  usage
fi

#for i in `find . -depth 1 -exec basename {} \;`; do
for i in `find . -maxdepth 1 -exec basename {} \;`; do
  echo ${i} | egrep ${EXCLUDE} 1> /dev/null && echo "skipping ${i}" &&  continue
  if [ -f ${HOME}/${i} ] ; then
    echo "${HOME}/$i already exists"
    continue
  fi
  if [ -d ${HOME}/${i} ] ; then
    echo "${HOME}/$i already exists"
    continue
  fi
  ln -vs ${pwd}/$i ${HOME}/$i
done
