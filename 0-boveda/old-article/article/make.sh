#!/bin/bash

pdflatex -synctex=1 -interaction=nonstopmode ocarina6.tex
biber ocarina6
pdflatex -synctex=1 -interaction=nonstopmode ocarina6.tex
biber ocarina6
pdflatex -synctex=1 -interaction=nonstopmode ocarina6.tex
pdflatex -synctex=1 -interaction=nonstopmode ocarina6.tex

./clean.sh
