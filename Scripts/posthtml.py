#!/usr/local/bin/python
# Edits and appends the html files 

import sys
import string
import re

regex1=re.compile( "\s+<code>\s+")
regex2=re.compile( "\s+</code>\s+")
infilenames=[]
for i in range(1,len(sys.argv)):
	f = open(sys.argv[i], 'r')
	filecontents=f.read()
	iteration1 = regex1.sub(' <code> ',filecontents)
	iteration2 = regex2.sub(' </code> ',iteration1)
	# print iteration2
	f.close()
	print sys.argv[i]
	m = open(sys.argv[i], 'w')
	m.write(iteration2)
# print infilenames
# newfile= open(infilenames[1],'r')
# newcontents=newfile.read()
# parts = newcontents.split('<body>')
# print parts[1]