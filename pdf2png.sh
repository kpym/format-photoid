#!/bin/sh

MUDRAW="/d/MyPrograms/TikZEdt/mudraw.exe"

# loop over pdfs
# ==============
for FIL in *pdf; do
  for HEIGHT in 300 700 1400; do
    echo $MUDRAW -h${HEIGHT} -o -a "${FIL%.*}_${HEIGHT}.png" "${FIL}"
    $MUDRAW -h${HEIGHT} -a -o "${FIL%.*}_${HEIGHT}.png" "${FIL}"
  done
done
