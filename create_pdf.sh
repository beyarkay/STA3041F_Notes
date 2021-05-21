#!/bin/bash
#
# LaTeX is great, but it's less great when you want to include graphics and 
#   graphs easily.
# 
# This script kinda solves that problem, by running scripts automatically 
#   before compiling the LaTeX.
# The idea is that you put code to create graphs in ./scripts/ and then save 
#   the graphs to ./images. 
#   Your LaTeX can then use those images and you can edit everything easily.
#
echo 'Running all scripts from scripts/'
for script in ./scripts/*; do
    echo "Running $script..."
    chmod +x $script
    ./$script 
done
echo 'Compiling LaTeX...'
# Run it twice to make sure the images all get referenced correctly.
pdflatex STA3041F_Notes.tex && pdflatex STA3041F_Notes.tex > /dev/null && echo 'All Complete' && rm *.aux *.toc *.log *.out
