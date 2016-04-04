#!/bin/bash        

cd ../HTML
jupyter nbconvert --to html ../notebooks/0_Toc.ipynb ../notebooks/1-Motivation-and-Introduction.ipynb ../notebooks/2-ROOT-Basics.ipynb ../notebooks/3-ROOT-Macros.ipynb ../notebooks/4-Graphs.ipynb ../notebooks/5-Histograms.ipynb ../notebooks/6-Functions-and-Parameter-Estimation.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis.ipynb ../notebooks/8-ROOT-in-Python.ipynb ../notebooks/9-Concluding-Remarks.ipynb
# cd ../PDF
# jupyter nbconvert --to pdf ../notebooks/0_Toc.ipynb ../notebooks/1-Motivation-and-Introduction.ipynb ../notebooks/2-ROOT-Basics.ipynb ../notebooks/3-ROOT-Macros.ipynb ../notebooks/4-Graphs.ipynb ../notebooks/5-Histograms.ipynb ../notebooks/6-Functions-and-Parameter-Estimation.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis.ipynb ../notebooks/8-ROOT-in-Python.ipynb ../notebooks/9-Concluding-Remarks.ipynb
