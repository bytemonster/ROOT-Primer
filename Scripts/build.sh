#!/bin/bash
pdf="pdf"
html="html"

NBDIR=../notebooks
NBEXT=.ipynb
HTML=.html
NBEXTNEW=.nbconvert.ipynb
NBEXTMD=.nbconvert.md

if [ "$1" = "pdf" ]
then
	for name in `echo 1-Motivation-and-Introduction 2-ROOT-Basics 3-ROOT-Macros 4-Graphs 5-Histograms 6-Functions-and-Parameter-Estimation 7-File-IO-and-Parallel-Analysis 8-ROOT-in-Python 9-Concluding-Remarks`;do
	 	python removeJS.py $NBDIR/$name$NBEXT $NBDIR/"$name"_NOJS"$NBEXT";
		jupyter nbconvert --ExecutePreprocessor.timeout=2000 --to notebook --execute $NBDIR/"$name"_NOJS"$NBEXT";
		jupyter nbconvert --to markdown $NBDIR/"$name"_NOJS"$NBEXTNEW" --template=mytemplate.tpl;
	done
	cd ../notebooks
	pandoc --toc --template=../Scripts/mdtemplate.tex $NBDIR/1-Motivation-and-Introduction_NOJS$NBEXTMD $NBDIR/2-ROOT-Basics_NOJS$NBEXTMD $NBDIR/3-ROOT-Macros_NOJS$NBEXTMD $NBDIR/4-Graphs_NOJS$NBEXTMD $NBDIR/5-Histograms_NOJS$NBEXTMD $NBDIR/6-Functions-and-Parameter-Estimation_NOJS$NBEXTMD $NBDIR/7-File-IO-and-Parallel-Analysis_NOJS$NBEXTMD $NBDIR/8-ROOT-in-Python_NOJS$NBEXTMD $NBDIR/9-Concluding-Remarks_NOJS$NBEXTMD --latex-engine=pdflatex -o ../ROOT-Primer_v0.pdf
	# "/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"  -o primenr_fin.pdf ../ROOT-Primer.pdf ../ROOT-Primer_v0.pdf 
	pdftk frontpage.pdf ../ROOT-Primer_v0.pdf output ../ROOT-Primer.pdf 
	rm -rf *NOJS*
elif [ "$1" = "html" ]
then
	chapter=0

	for name in `echo ROOT_Primer 1-Motivation-and-Introduction 2-ROOT-Basics 3-ROOT-Macros 4-Graphs 5-Histograms 6-Functions-and-Parameter-Estimation 7-File-IO-and-Parallel-Analysis 8-ROOT-in-Python 9-Concluding-Remarks`;do
	 	python addtitle.py $NBDIR/$name"$NBEXT"
		jupyter nbconvert --ExecutePreprocessor.timeout=600 --to html $NBDIR/$name"$NBEXT"
		python3 html-post-prossesor_BS.py $NBDIR/$name"$HTML" $NBDIR/$name.prep"$HTML" $chapter
		python posthtml.py $NBDIR/$name.prep"$HTML" 
		let chapter=chapter+1
	done
	python makehtml.py $NBDIR/ROOT_Primer.prep.html $NBDIR/1-Motivation-and-Introduction.prep.html $NBDIR/2-ROOT-Basics.prep.html $NBDIR/3-ROOT-Macros.prep.html $NBDIR/4-Graphs.prep.html $NBDIR/5-Histograms.prep.html $NBDIR/6-Functions-and-Parameter-Estimation.prep.html $NBDIR/7-File-IO-and-Parallel-Analysis.prep.html $NBDIR/8-ROOT-in-Python.prep.html $NBDIR/9-Concluding-Remarks.prep.html
	rm $NBDIR/1-Motivation-and-Introduction.html $NBDIR/1-Motivation-and-Introduction.prep.html
	rm $NBDIR/2-ROOT-Basics.html $NBDIR/2-ROOT-Basics.prep.html 
	rm $NBDIR/3-ROOT-Macros.html $NBDIR/3-ROOT-Macros.prep.html 
	rm $NBDIR/4-Graphs.html $NBDIR/4-Graphs.prep.html 
	rm $NBDIR/5-Histograms.html $NBDIR/5-Histograms.prep.html
	rm $NBDIR/6-Functions-and-Parameter-Estimation.html $NBDIR/6-Functions-and-Parameter-Estimation.prep.html
	rm $NBDIR/7-File-IO-and-Parallel-Analysis.html $NBDIR/7-File-IO-and-Parallel-Analysis.prep.html
	rm $NBDIR/8-ROOT-in-Python.html $NBDIR/8-ROOT-in-Python.prep.html
	rm $NBDIR/9-Concluding-Remarks.html $NBDIR/9-Concluding-Remarks.prep.html
	rm $NBDIR/ROOT_Primer.html $NBDIR/ROOT_Primer.prep.html 
elif [ "$1" = "all" ]
then
	for name in `echo 1-Motivation-and-Introduction 2-ROOT-Basics 3-ROOT-Macros 4-Graphs 5-Histograms 6-Functions-and-Parameter-Estimation 7-File-IO-and-Parallel-Analysis 8-ROOT-in-Python 9-Concluding-Remarks`;do
	 	python removeJS.py $NBDIR/$name$NBEXT $NBDIR/"$name"_NOJS"$NBEXT";
		jupyter nbconvert --ExecutePreprocessor.timeout=2000 --to notebook --execute $NBDIR/"$name"_NOJS"$NBEXT";
		jupyter nbconvert --to markdown $NBDIR/"$name"_NOJS"$NBEXTNEW" --template=mytemplate.tpl;
	done
	cd ../notebooks
	pandoc --toc --template=../Scripts/mdtemplate.tex $NBDIR/1-Motivation-and-Introduction_NOJS$NBEXTMD $NBDIR/2-ROOT-Basics_NOJS$NBEXTMD $NBDIR/3-ROOT-Macros_NOJS$NBEXTMD $NBDIR/4-Graphs_NOJS$NBEXTMD $NBDIR/5-Histograms_NOJS$NBEXTMD $NBDIR/6-Functions-and-Parameter-Estimation_NOJS$NBEXTMD $NBDIR/7-File-IO-and-Parallel-Analysis_NOJS$NBEXTMD $NBDIR/8-ROOT-in-Python_NOJS$NBEXTMD $NBDIR/9-Concluding-Remarks_NOJS$NBEXTMD --latex-engine=pdflatex -o ../ROOT-Primer_v0.pdf
	# "/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"  -o primenr_fin.pdf ../ROOT-Primer.pdf ../ROOT-Primer_v0.pdf 
	pdftk frontpage.pdf ../ROOT-Primer_v0.pdf output ../ROOT-Primer.pdf 
	rm -rf *NOJS*
	rm ../ROOT-Primer_v0.pdf
	cd ../Scripts
	chapter=0
	for name in `echo ROOT_Primer 1-Motivation-and-Introduction 2-ROOT-Basics 3-ROOT-Macros 4-Graphs 5-Histograms 6-Functions-and-Parameter-Estimation 7-File-IO-and-Parallel-Analysis 8-ROOT-in-Python 9-Concluding-Remarks`;do
	 	python addtitle.py $NBDIR/$name"$NBEXT"
		jupyter nbconvert --ExecutePreprocessor.timeout=600 --to html $NBDIR/$name"$NBEXT"
		python3 html-post-prossesor_BS.py $NBDIR/$name"$HTML" $NBDIR/$name.prep"$HTML" $chapter
		python posthtml.py $NBDIR/$name.prep"$HTML" 
		let chapter=chapter+1
	done
	python makehtml.py $NBDIR/ROOT_Primer.prep.html $NBDIR/1-Motivation-and-Introduction.prep.html $NBDIR/2-ROOT-Basics.prep.html $NBDIR/3-ROOT-Macros.prep.html $NBDIR/4-Graphs.prep.html $NBDIR/5-Histograms.prep.html $NBDIR/6-Functions-and-Parameter-Estimation.prep.html $NBDIR/7-File-IO-and-Parallel-Analysis.prep.html $NBDIR/8-ROOT-in-Python.prep.html $NBDIR/9-Concluding-Remarks.prep.html
	rm $NBDIR/1-Motivation-and-Introduction.html $NBDIR/1-Motivation-and-Introduction.prep.html
	rm $NBDIR/2-ROOT-Basics.html $NBDIR/2-ROOT-Basics.prep.html 
	rm $NBDIR/3-ROOT-Macros.html $NBDIR/3-ROOT-Macros.prep.html 
	rm $NBDIR/4-Graphs.html $NBDIR/4-Graphs.prep.html 
	rm $NBDIR/5-Histograms.html $NBDIR/5-Histograms.prep.html
	rm $NBDIR/6-Functions-and-Parameter-Estimation.html $NBDIR/6-Functions-and-Parameter-Estimation.prep.html
	rm $NBDIR/7-File-IO-and-Parallel-Analysis.html $NBDIR/7-File-IO-and-Parallel-Analysis.prep.html
	rm $NBDIR/8-ROOT-in-Python.html $NBDIR/8-ROOT-in-Python.prep.html
	rm $NBDIR/9-Concluding-Remarks.html $NBDIR/9-Concluding-Remarks.prep.html
	rm $NBDIR/ROOT_Primer.html $NBDIR/ROOT_Primer.prep.html 

else
	echo "wrong arguments. Accepted arguments are: pdf, html, all"
fi


# --latex-engine=pdflatex -o ../test.pdf


# .prep/html