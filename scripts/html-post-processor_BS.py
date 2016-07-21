#!/usr/local/bin/python
# prepares the html files for appending

try:
	from bssdv4 import BeautifulSoup
except ImportError as err:
	print("BeautifulSoup is not installed. To install it use apt-get install python-bs4 or visit https://www.crummy.com/software/BeautifulSoup/ for more information. \n OS error: {0}".format(err))
	raise
import sys
import string
import os
import re


infilename = sys.argv[1]
outfilename = sys.argv[2]
chapter = sys.argv[3]

script_dir = os.path.dirname(__file__)
rel_path = "../notebooks"
abs_path = os.path.join(script_dir, rel_path)
abs_in_path = os.path.join(abs_path, infilename)
abs_out_path = os.path.join(abs_path, outfilename)
abs_final_path = os.path.join(abs_path, "final.html")

############ OPEN FILES ############
f = open(abs_in_path, 'r')
m= open(abs_out_path, 'w')
final_file = open(abs_final_path, 'w')

############ PARSE TEXT ############
soup = BeautifulSoup(f.read().decode('utf-8'),"html.parser")
############ SELECT ALL DIVS ############
divtags = soup.findAll('div')

ROOT_Primer_nav = soup.find_all(text=re.compile('ROOT-Primer Navigator'))
paragraphs = [nav.parent for nav in ROOT_Primer_nav]
divs = [paragraph.parent for paragraph in paragraphs]

############ EDIT BASED ON METADATA ############
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
	if tag in divs:
		tag.decompose()


# print(soup)
m.write(soup.prettify().encode('utf-8'))
