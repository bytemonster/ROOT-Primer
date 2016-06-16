# Edits and appends the html files 

import sys
import string
import re

def rchop(thestring, ending):
  if thestring.endswith(ending):
    return thestring[:-len(ending)]
  return thestring

finregex=re.compile("<body>(?P<bodyText>[\s\S]*)</body>")
last_text=re.compile("</body>[\s\S]*</html>[\s\S]*")
files_no = len(sys.argv)
infilenames=[]

final = open('../final.html', 'w')
first =open(sys.argv[1], 'r')
firstitem=first.read()
firstimport = last_text.sub('',firstitem)

finaltext =  firstimport
first.close()
for i in range(2,len(sys.argv)):
	next=open(sys.argv[i], 'r')
	nextimport=next.read()
	nextimportcontents=finregex.search(nextimport)
	finaltext+=nextimportcontents.group("bodyText")

finaltext +='</body>\n?</html>'

final.write(finaltext)

