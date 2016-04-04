#!/bin/bash        
pdf="pdf"
html="html"

if [ "$1" = "pdf" ]
then
	cd ../PDF
	jupyter nbconvert --to pdf ../notebooks/0_Toc.ipynb ../notebooks/1-Motivation-and-Introduction.ipynb ../notebooks/2-ROOT-Basics.ipynb ../notebooks/3-ROOT-Macros.ipynb ../notebooks/4-Graphs.ipynb ../notebooks/5-Histograms.ipynb ../notebooks/6-Functions-and-Parameter-Estimation.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis.ipynb ../notebooks/8-ROOT-in-Python.ipynb ../notebooks/9-Concluding-Remarks.ipynb
elif [ "$1" = "html" ]
then
	cd ../HTML
	jupyter nbconvert --to html ../notebooks/0_Toc.ipynb ../notebooks/1-Motivation-and-Introduction.ipynb ../notebooks/2-ROOT-Basics.ipynb ../notebooks/3-ROOT-Macros.ipynb ../notebooks/4-Graphs.ipynb ../notebooks/5-Histograms.ipynb ../notebooks/6-Functions-and-Parameter-Estimation.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis.ipynb ../notebooks/8-ROOT-in-Python.ipynb ../notebooks/9-Concluding-Remarks.ipynb
else
	echo "wrong arguments. Accepted arguments are: PDF, pdf, HTML, html"
fi