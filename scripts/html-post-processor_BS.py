#!/usr/local/bin/python
# prepares the html files for appending

from bs4 import BeautifulSoup
import sys
import string
import os


infilename = sys.argv[1]
outfilename = sys.argv[2]
chapter = sys.argv[3]

script_dir = os.path.dirname(__file__) 
rel_path = "../notebooks"
abs_path = os.path.join(script_dir, rel_path)
abs_in_path = os.path.join(abs_path, infilename)
abs_out_path = os.path.join(abs_path, outfilename)
abs_final_path = os.path.join(abs_path, "final.html")

f = open(abs_in_path, 'r')
m= open(abs_out_path, 'w')

final_file = open(abs_final_path, 'w')
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

 