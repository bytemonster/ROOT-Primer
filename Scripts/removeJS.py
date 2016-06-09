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
infilename = sys.argv[1]
outfilename = sys.argv[2]
f = open(infilename)
# lines = f.readlines()
# f.close()
# text = "".join(lines)

nb = nbformat.read(infilename, 4)
nb_new = nbformat.NotebookNode()

cells_new=[]
offset = 0
for cell in nb.cells:
  if cell["cell_type"] == "code":
    if cell["source"] == '%jsroot on':
      offset = -1
    else: 
      cells_new.append(new_code_cell(
      source=cell.source,
      metadata=cell.metadata,
      outputs=[],
      # print cell.execution_count
      execution_count=cell.execution_count+offset))
      # print cell.execution_count+offset
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

with codecs.open(outfilename, encoding='utf-8', mode='w') as out:
    nbformat.write(nb_new, out)

# nbformat.write(nb, fp, version=nbformat.NO_CONVERT, **kwargs)
#################################################################
# true=True
# false=False

# nbj = eval(text)

# cells = nbj["cells"]

# newcells=[]
# jscount = 0
# mustdecrement = False
# for cell in cells:
#    if cell["cell_type"] == "code":
#       if cell["source"][0] == "%%jsroot on":
#         mustdecrement = True
#         jscount = 1
#         continue
#       else:
#         if mustdecrement:
#           cell["execution_count"] -= 1
#         newcells.append(cell)
#    else:
#       newcells.append(cell)
# nbj["cells"] = newcells


# newnb = open(outfilename,"w")
# newnb.write(str(nbj))
# newnb.close()