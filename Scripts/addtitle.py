import string
import sys
import json
import nbformat
from nbformat import NotebookNode
from nbconvert.preprocessors import ExecutePreprocessor
from StringIO import StringIO
import codecs
from nbformat.v4.nbbase import (
    new_code_cell, new_markdown_cell, new_notebook,
    new_output, new_raw_cell
)
filename = sys.argv[1]
f = open(filename)
# lines = f.readlines()
# f.close()
# text = "".join(lines)

nb = nbformat.read(filename, 4)
nb_new = nbformat.NotebookNode()

cells_new=[]
title = filename
i=0
while i==0:
  if "/" in title:
    title=title.split('/', 1)[-1]
  else:
    i=1

while "_" in title:
  title=title.split('_', 1)[0]

title = title.replace("-"," ")
title = "# "+title

for cell in nb.cells:
  if cell["cell_type"] == "code":
    cells_new.append(new_code_cell(
    source=cell.source,
    metadata=cell.metadata,
    outputs=cell.outputs,
    execution_count=cell.execution_count))
  elif cell["cell_type"] == "markdown":
    cells_new.append(new_markdown_cell(
    source=cell.source,
    metadata=cell.metadata))
  else:
    cells_new.append(new_raw_cell(
    source=cell.source,
    metadata=cell.metadata))

  # print cell.cell_type
  
nb_new = new_notebook(cells=cells_new,
    metadata=nb.metadata,
    nbformat=nb.nbformat,
    nbformat_minor=nb.nbformat_minor
)

with codecs.open(filename, encoding='utf-8', mode='w') as out:
    nbformat.write(nb_new, out)