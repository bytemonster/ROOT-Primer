	jupyter nbconvert --ExecutePreprocessor.timeout=600 --kernel_name python3 --to notebook --execute ../notebooks/1-Motivation-and-Introduction_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --kernel_name 'ROOT C++'--to notebook --execute ../notebooks/2-ROOT-Basics_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute ../notebooks/3-ROOT-Macros_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute ../notebooks/4-Graphs_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute ../notebooks/5-Histograms_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute ../notebooks/6-Functions-and-Parameter-Estimation_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute ../notebooks/7-File-IO-and-Parallel-Analysis_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute ../notebooks/8-ROOT-in-Python_NOJS.ipynb 
	jupyter nbconvert --ExecutePreprocessor.timeout=600 --to notebook --execute ../notebooks/9-Concluding-Remarks_NOJS.ipynb

from nbformat import NotebookNode
from nbconvert.preprocessors import ExecutePreprocessor
from StringIO import StringIO
import codecs
from nbformat.v4.nbbase import (
    new_code_cell, new_markdown_cell, new_notebook,
    new_output, new_raw_cell
)