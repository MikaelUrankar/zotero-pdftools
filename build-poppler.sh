#!/bin/sh
# https://github.com/zotero/cross-poppler/blob/master/Dockerfile

ROOT=/root/zotero/zotero-poppler

# fetch https://poppler.freedesktop.org/poppler-0.62.0.tar.xz
# fetch https://raw.githubusercontent.com/zotero/cross-poppler/master/pdftotext.cc

rm -rf ${ROOT}/poppler
mkdir ${ROOT}/poppler \
      ${ROOT}/poppler/build \
      ${ROOT}/pdftools

tar -xf poppler-0.62.0.tar.xz -C poppler --strip-components=1

patch -s -d poppler -i ../patch-CMakeLists.txt
patch -s -d poppler -i ../patch-poppler_TextOutputDev.cc
patch -s -d poppler -i ../patch-utils_pdfinfo.cc

cp pdftotext.cc ${ROOT}/poppler/TextOutputDev.cc

cd ${ROOT}/poppler/build

cmake -DCMAKE_BUILD_TYPE=release \
	-DBUILD_SHARED_LIBS=OFF \
	-DBUILD_GTK_TESTS=OFF \
	-DBUILD_QT4_TESTS=OFF \
	-DBUILD_QT5_TESTS=OFF \
	-DBUILD_CPP_TESTS=OFF \
	-DENABLE_SPLASH=OFF \
	-DENABLE_CPP=OFF \
	-DENABLE_GLIB=OFF \
	-DENABLE_GTK_DOC=OFF \
	-DENABLE_QT4=OFF \
	-DENABLE_QT5=OFF \
	-DENABLE_LIBOPENJPEG=unmaintained \
	-DENABLE_CMS=none \
	-DENABLE_LIBCURL=OFF \
	-DENABLE_ZLIB=OFF \
	-DENABLE_DCTDECODER=unmaintained \
	-DENABLE_ZLIB_UNCOMPRESS=OFF \
	-DSPLASH_CMYK=OFF \
	-DWITH_JPEG=OFF \
	-DWITH_PNG=OFF \
	-DWITH_TIFF=OFF \
	-DWITH_NSS3=OFF \
	-DWITH_Cairo=OFF \
	-DWITH_FONTCONFIGURATION_FONTCONFIG=OFF \
	-DCMAKE_CXX_FLAGS="-std=c++11 -Os" \
	-DCMAKE_EXE_LINKER_FLAGS="-static -pthread" ..

make -j25

cp ${ROOT}/poppler/build/utils/pdftotext ${ROOT}/pdftools
cp ${ROOT}/poppler/build/utils/pdfinfo   ${ROOT}/pdftools
