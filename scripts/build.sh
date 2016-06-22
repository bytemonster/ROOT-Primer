#!/bin/bash
set -e
pdf="pdf"
html="html"
get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

BASEDIR=$(cd $(dirname $BASH_SOURCE);pwd)
NBDIR=$BASEDIR/../notebooks
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
		jupyter nbconvert --ExecutePreprocessor.timeout=600 --to html $NBDIR/$name"$NBEXT"
		python $BASEDIR/html-post-processor_BS.py $name"$HTML" $name.prep"$HTML" $chapter
		python $BASEDIR/posthtml.py $NBDIR/$name.prep"$HTML" 
		let chapter=chapter+1
	done
	python $BASEDIR/makehtml.py $NBDIR/*.prep.html
	find $NBDIR -type f -name "*.html" -and -not -name "final.html" | xargs rm
	# rm $NBDIR/*.html
fi
if [ "$1" = "pdf" ] || [ "$1" = "all" ]
then
	for name in $NBLISTPDF ;do
	 	python $BASEDIR/removeJS.py $NBDIR/$name$NBEXT $NBDIR/"$name"_NOJS"$NBEXT";
		jupyter nbconvert --ExecutePreprocessor.timeout=2000 --to notebook --execute $NBDIR/"$name"_NOJS"$NBEXT";
		jupyter nbconvert --to markdown $NBDIR/"$name"_NOJS"$NBEXTNEW" --template=mytemplate.tpl;
	done
	cd $NBDIR
	echo $BASEDIR
	pandoc --toc --template=$BASEDIR/mdtemplate.tex $NBDIR/*_NOJS$NBEXTMD --latex-engine=pdflatex -o $NBDIR/ROOT-Primer_v0.pdf
	pdftk frontpage.pdf $NBDIR/ROOT-Primer_v0.pdf output $NBDIR/ROOT-Primer.pdf
	rm -rf *NOJS*
	rm $NBDIR/ROOT-Primer_v0.pdf
fi
if [ "$1" != "html" ] && [ "$1" != "all" ] && [ "$1" != "pdf" ] 
then
	echo "Wrong arguments. Accepted arguments are: pdf, html, all"
fi

