# fetch https://poppler.freedesktop.org/poppler-data-0.4.8.tar.gz
rm -rf poppler-data pdftools/poppler-data
mkdir poppler-data
tar -xf poppler-data-0.4.8.tar.gz -C poppler-data --strip-components=1
cd pdftools
mkdir -p poppler-data
cd poppler-data
cp -r ../../poppler-data/cidToUnicode .
cp -r ../../poppler-data/cMap .
cp -r ../../poppler-data/nameToUnicode .
cp -r ../../poppler-data/unicodeMap .
cp -r ../../poppler-data/COPYING .
cp -r ../../poppler-data/COPYING.adobe .
cp -r ../../poppler-data/COPYING.gpl2 .
cd ..
tar -cvzf ../pdftools.tar.gz *
