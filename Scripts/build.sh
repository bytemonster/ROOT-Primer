#!/bin/bash        
pdf="pdf"
html="html"

if [ "$1" = "pdf" ]
then
	cd ../Scripts
	python removeJS.py ../notebooks/1-Motivation-and-Introduction.ipynb ../notebooks/1-Motivation-and-Introduction_NOJS.ipynb
	python removeJS.py ../notebooks/2-ROOT-Basics.ipynb ../notebooks/2-ROOT-Basics_NOJS.ipynb 
	python removeJS.py ../notebooks/3-ROOT-Macros.ipynb ../notebooks/3-ROOT-Macros_NOJS.ipynb 
	python removeJS.py ../notebooks/4-Graphs.ipynb ../notebooks/4-Graphs_NOJS.ipynb 
	python removeJS.py ../notebooks/5-Histograms.ipynb ../notebooks/5-Histograms_NOJS.ipynb 
	python removeJS.py ../notebooks/6-Functions-and-Parameter-Estimation.ipynb ../notebooks/6-Functions-and-Parameter-Estimation_NOJS.ipynb 
	python removeJS.py ../notebooks/7-File-IO-and-Parallel-Analysis.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis_NOJS.ipynb 
	python removeJS.py ../notebooks/8-ROOT-in-Python.ipynb ../notebooks/8-ROOT-in-Python_NOJS.ipynb 
	python removeJS.py ../notebooks/9-Concluding-Remarks.ipynb ../notebooks/9-Concluding-Remarks_NOJS.ipynb
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --ExecutePreprocessor.kernel_name='python3' --to notebook --execute ../notebooks/1-Motivation-and-Introduction_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --ExecutePreprocessor.kernel_name='root' --to notebook --execute ../notebooks/2-ROOT-Basics_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --ExecutePreprocessor.kernel_name='ROOT' --to notebook --execute ../notebooks/3-ROOT-Macros_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --ExecutePreprocessor.kernel_name='ROOT' --to notebook --execute ../notebooks/4-Graphs_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --ExecutePreprocessor.kernel_name='ROOT' --to notebook --execute ../notebooks/5-Histograms_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --ExecutePreprocessor.kernel_name='ROOT' --to notebook --execute ../notebooks/6-Functions-and-Parameter-Estimation_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --ExecutePreprocessor.kernel_name='ROOT' --to notebook --execute ../notebooks/7-File-IO-and-Parallel-Analysis_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --ExecutePreprocessor.kernel_name='python3' --to notebook --execute ../notebooks/9-Concluding-Remarks_NOJS.ipynb

	# cd ../
	# jupyter nbconvert --to pdf notebooks/1-Motivation-and-Introduction_NOJS.ipynb notebooks/2-ROOT-Basics_NOJS.ipynb notebooks/3-ROOT-Macros_NOJS.ipynb notebooks/4-Graphs_NOJS.ipynb notebooks/5-Histograms_NOJS.ipynb notebooks/6-Functions-and-Parameter-Estimation_NOJS.ipynb notebooks/7-File-IO-and-Parallel-Analysis_NOJS.ipynb notebooks/8-ROOT-in-Python_NOJS.ipynb notebooks/9-Concluding-Remarks_NOJS.ipynb
	cd ../MARKDOWN
	jupyter nbconvert --to markdown ../notebooks/1-Motivation-and-Introduction_NOJS.ipynb ../notebooks/2-ROOT-Basics_NOJS.ipynb ../notebooks/3-ROOT-Macros_NOJS.ipynb ../notebooks/4-Graphs_NOJS.ipynb ../notebooks/5-Histograms_NOJS.ipynb ../notebooks/6-Functions-and-Parameter-Estimation_NOJS.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis_NOJS.ipynb ../notebooks/8-ROOT-in-Python_NOJS.ipynb ../notebooks/9-Concluding-Remarks_NOJS.ipynb
	pandoc --toc 1-Motivation-and-Introduction_NOJS.md 2-ROOT-Basics_NOJS.md 3-ROOT-Macros_NOJS.md 4-Graphs_NOJS.md 5-Histograms_NOJS.md 6-Functions-and-Parameter-Estimation_NOJS.md 7-File-IO-and-Parallel-Analysis_NOJS.md 8-ROOT-in-Python_NOJS.md 9-Concluding-Remarks_NOJS.md --latex-engine=xelatex -o ../ROOT-Primer.pdf
elif [ "$1" = "html" ]
then
	mkdir -p ../HTML
	cd ..
	jupyter nbconvert --to html ../notebooks/0_Toc.ipynb ../notebooks/1-Motivation-and-Introduction.ipynb ../notebooks/2-ROOT-Basics.ipynb ../notebooks/3-ROOT-Macros.ipynb ../notebooks/4-Graphs.ipynb ../notebooks/5-Histograms.ipynb ../notebooks/6-Functions-and-Parameter-Estimation.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis.ipynb ../notebooks/8-ROOT-in-Python.ipynb ../notebooks/9-Concluding-Remarks.ipynb

elif [ "$1" = "markdown" ]
then
	mkdir -p ../MARKDOWN
	cd ../MARKDOWN
	jupyter nbconvert --to markdown ../notebooks/0_Toc.ipynb ../notebooks/1-Motivation-and-Introduction.ipynb ../notebooks/2-ROOT-Basics.ipynb ../notebooks/3-ROOT-Macros.ipynb ../notebooks/4-Graphs.ipynb ../notebooks/5-Histograms.ipynb ../notebooks/6-Functions-and-Parameter-Estimation.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis.ipynb ../notebooks/8-ROOT-in-Python.ipynb ../notebooks/9-Concluding-Remarks.ipynb
elif [ "$1" = "latex" ]
then
	mkdir -p ../LATEX
	cd ../LATEX
	jupyter nbconvert --to latex ../notebooks/0_Toc.ipynb ../notebooks/1-Motivation-and-Introduction.ipynb ../notebooks/2-ROOT-Basics.ipynb ../notebooks/3-ROOT-Macros.ipynb ../notebooks/4-Graphs.ipynb ../notebooks/5-Histograms.ipynb ../notebooks/6-Functions-and-Parameter-Estimation.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis.ipynb ../notebooks/8-ROOT-in-Python.ipynb ../notebooks/9-Concluding-Remarks.ipynb
elif [ "$1" = "all" ]
then
	mkdir -p ../PDF
	mkdir -p ../HTML
	mkdir -p ../LATEX
	mkdir -p ../MARKDOWN
	cd ../MARKDOWN
	jupyter nbconvert --to markdown ../notebooks/0_Toc.ipynb ../notebooks/1-Motivation-and-Introduction.ipynb ../notebooks/2-ROOT-Basics.ipynb ../notebooks/3-ROOT-Macros.ipynb ../notebooks/4-Graphs.ipynb ../notebooks/5-Histograms.ipynb ../notebooks/6-Functions-and-Parameter-Estimation.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis.ipynb ../notebooks/8-ROOT-in-Python.ipynb ../notebooks/9-Concluding-Remarks.ipynb
	cd ../MARKDOWN
	pandoc --toc 1-Motivation-and-Introduction.md 2-ROOT-Basics.md 3-ROOT-Macros.md 4-Graphs.md 5-Histograms.md 6-Functions-and-Parameter-Estimation.md 7-File-IO-and-Parallel-Analysis.md 8-ROOT-in-Python.md 9-Concluding-Remarks.md --latex-engine=xelatex -o ../PDF/ROOT-Primer.pdf
    cd ../HTML
	jupyter nbconvert --to html ../notebooks/0_Toc.ipynb ../notebooks/1-Motivation-and-Introduction.ipynb ../notebooks/2-ROOT-Basics.ipynb ../notebooks/3-ROOT-Macros.ipynb ../notebooks/4-Graphs.ipynb ../notebooks/5-Histograms.ipynb ../notebooks/6-Functions-and-Parameter-Estimation.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis.ipynb ../notebooks/8-ROOT-in-Python.ipynb ../notebooks/9-Concluding-Remarks.ipynb
	cd ../LATEX
	jupyter nbconvert --to latex ../notebooks/0_Toc.ipynb ../notebooks/1-Motivation-and-Introduction.ipynb ../notebooks/2-ROOT-Basics.ipynb ../notebooks/3-ROOT-Macros.ipynb ../notebooks/4-Graphs.ipynb ../notebooks/5-Histograms.ipynb ../notebooks/6-Functions-and-Parameter-Estimation.ipynb ../notebooks/7-File-IO-and-Parallel-Analysis.ipynb ../notebooks/8-ROOT-in-Python.ipynb ../notebooks/9-Concluding-Remarks.ipynb

else
	echo "wrong arguments. Accepted arguments are: pdf, html, markdown, all"
fi