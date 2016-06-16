#!/bin/bash
set -e
pdf="pdf"
html="html"

NBDIR=../notebooks
NBEXT=.ipynb
HTML=.html
NBEXTNEW=.nbconvert.ipynb
NBEXTMD=.nbconvert.md
NBLISTPDF=`echo 1-Motivation-and-Introduction 2-ROOT-Basics 3-ROOT-Macros 4-Graphs 5-Histograms 6-Functions-and-Parameter-Estimation 7-File-IO-and-Parallel-Analysis 8-ROOT-in-Python 9-Concluding-Remarks`
NBLISTHTML=`echo 0_ROOT_Primer_TOC 1-Motivation-and-Introduction 2-ROOT-Basics 3-ROOT-Macros 4-Graphs 5-Histograms 6-Functions-and-Parameter-Estimation 7-File-IO-and-Parallel-Analysis 8-ROOT-in-Python 9-Concluding-Remarks`


if [ "$1" = "html" ] || [ "$1" = "all" ]
then
	chapter=0
	for name in $NBLISTHTML ;do
	 	# python addtitle.py $NBDIR/$name"$NBEXT"
		jupyter nbconvert --ExecutePreprocessor.timeout=600 --to html $NBDIR/$name"$NBEXT"
		python html-post-processor_BS.py $NBDIR/$name"$HTML" $NBDIR/$name.prep"$HTML" $chapter
		python posthtml.py $NBDIR/$name.prep"$HTML" 
		let chapter=chapter+1
	done
	python makehtml.py $NBDIR/*.prep.html
	rm $NBDIR/*.html
fi
if [ "$1" = "pdf" ] || [ "$1" = "all" ]
then
	for name in $NBLISTPDF ;do
	 	python removeJS.py $NBDIR/$name$NBEXT $NBDIR/"$name"_NOJS"$NBEXT";
		jupyter nbconvert --ExecutePreprocessor.timeout=2000 --to notebook --execute $NBDIR/"$name"_NOJS"$NBEXT";
		jupyter nbconvert --to markdown $NBDIR/"$name"_NOJS"$NBEXTNEW" --template=mytemplate.tpl;
	done
	cd $NBDIR
	pandoc --toc --template=../Scripts/mdtemplate.tex $NBDIR/*_NOJS$NBEXTMD --latex-engine=pdflatex -o ../ROOT-Primer_v0.pdf
	pdftk frontpage.pdf ../ROOT-Primer_v0.pdf output ../ROOT-Primer.pdf 
	rm -rf *NOJS*
	rm ../ROOT-Primer_v0.pdf
fi
if [ "$1" != "html" ] && [ "$1" != "all" ] && [ "$1" != "pdf" ] 
then
	echo "Wrong arguments. Accepted arguments are: pdf, html, all"
fi

