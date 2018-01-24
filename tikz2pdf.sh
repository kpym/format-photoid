#!/bin/sh

MUDRAW="/d/MyPrograms/TikZEdt/mudraw.exe"
INCSCAPE="/d/MyPrograms/InkScape/inkscape.exe"
MAGIC="/d/MyPrograms/ImageMagick/magick.exe"

# loop over pdfs
# ==============
for FIL in *.tikz; do
    # ----- with texte
    echo "\documentclass[tikz,border=0pt]{standalone}\newif\iftext\texttrue\begin{document}" > "${FIL%.*}_text.tex"
    tail --line=+3 "${FIL}" >> "${FIL%.*}_text.tex"
    echo "\end{document}" >> "${FIL%.*}_text.tex"
    xelatex "${FIL%.*}_text.tex"
    latex "${FIL%.*}_text.tex"
    dvips -E0 -o "${FIL%.*}_text.eps" "${FIL%.*}_text.dvi"
    dvips "${FIL%.*}_text.dvi"

    # ----- without texte
    echo "\documentclass[tikz,border=0pt]{standalone}\newif\iftext\textfalse\begin{document}" > "${FIL%.*}_notext.tex"
    tail --line=+3 "${FIL}" >> "${FIL%.*}_notext.tex"
    echo "\end{document}" >> "${FIL%.*}_notext.tex"
    xelatex "${FIL%.*}_notext.tex"
    latex "${FIL%.*}_notext.tex"
    dvips -E0 -o "${FIL%.*}_notext.eps" "${FIL%.*}_notext.dvi"
    dvips "${FIL%.*}_notext.dvi"

    rm *.aux
    rm *.log
    rm *.dvi
done
