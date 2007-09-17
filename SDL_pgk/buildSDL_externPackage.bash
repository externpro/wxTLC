#! /bin/bash

# This script will build the SDL Solaris tgz package for use by SDL IS&R
# division software developers. The package will become part of the
# sdl_extern group of packages. 
# 

# Constants used for the "identity file".
WX=wx
TLC=treelistctrl
PKG=${WX}${TLC}
VER=1.0
OSs=`uname -s`
OSr=`uname -r`
OS=${OSs}${OSr}
COMPILER=gcc`gcc --version | grep "(GCC)" | awk '{print $3}'`
SDLVER=1
DEPENDS=wxwidgets-2.8.4

# Make release version; currently the only version in the tgz package.
BLD_DIR=_${OSs}_Release
BLDD_DIR=_${OSs}_Debug
PKG_DIR=TLC_pkg
PKG_FILENM=${PKG}-${VER}-${OS}-${COMPILER}-v${SDLVER}.tar

printf "Remove old package and package directory\n"
rm -f *.tgz
rm -rf ${PKG_DIR}

printf "Build new package directory\n"

gmake b=r -j 2 BLD_DIR=${BLD_DIR}
gmake -j 2 BLD_DIR=${BLDD_DIR}
if [[ $? ]]
then
  # Create the include directory and populate it with include files.
  TLC_INC=${PKG_DIR}/include/wxwidgets/wx/${TLC}
  TLC_INC_TXT=${PKG_DIR}/include/${TLC}
  TLC_INC_TXT_FILE=${TLC_INC_TXT}/${PKG}.txt

  mkdir -p ${TLC_INC}
  if [[ $? ]]
  then
    cp ../include/wx/*.h ${TLC_INC}

    # create the library directory and copy the library file
    mkdir -p ${PKG_DIR}/lib
    if [[ $? ]]
    then
      cp ../../lib/${BLD_DIR}/*.a ${PKG_DIR}/lib
      cp ../../lib/${BLDD_DIR}/*.a ${PKG_DIR}/lib
      if [[ $? ]]
      then
        # Create the identity file directory
        mkdir -p ${TLC_INC_TXT}

        # Create the identity file
        echo ${PKG} > ${TLC_INC_TXT_FILE}
        echo ${VER} >> ${TLC_INC_TXT_FILE}
        echo ${OS} >> ${TLC_INC_TXT_FILE}
        echo ${COMPILER} >> ${TLC_INC_TXT_FILE}
        echo ${SDLVER} >> ${TLC_INC_TXT_FILE}
        echo ${DEPENDS} >> ${TLC_INC_TXT_FILE}
        
        tar cf ${PKG_FILENM} -C ${PKG_DIR} . 
        bzip2 ${PKG_FILENM}

      else
         printf "%s failed to copy library files\n" $0 
      fi
    else
      printf "%s failed to make directory %s\n" $0 ${PKG_DIR}/lib
    fi
  else
    printf "%s failed to make treelistctrl directory\n" $0
    exit 1
  fi   
else
  printf "%s failed to make treelistctrl package\n" $0
  exit 1
fi

exit 0
