# prepares the html files for appending

from bs4 import BeautifulSoup
import sys
import string



infilename = sys.argv[1]
outfilename = sys.argv[2]
chapter = sys.argv[3]
f = open(infilename, 'r')

m= open(outfilename, 'w')
final_file = open('../notebooks/final.html', 'w')
soup = BeautifulSoup(f.read().decode('utf-8'),"html.parser")
divtags = soup.findAll('div')
for tag in soup.findAll('div'):
	if 'id' in tag.attrs:
		# print(tag.attrs['id'])
		if 'root_plot' in tag.attrs['id']:
			tag.attrs['id'] = tag.attrs['id'].replace('root_plot','root_plot'+'_'+chapter)
			# print(tag.attrs['id'])
	if 'class' in tag.attrs:
		if 'output_html' in tag.attrs['class']:
			for child in tag.children:
				if child.name=='script':
					# print(child.contents)
					child.contents[0].replace_with(str(child.contents[0]).replace('root_plot','root_plot'+'_'+chapter))
					# print(child.contents)

# print(soup)
m.write(soup.prettify().encode('utf-8'))

 