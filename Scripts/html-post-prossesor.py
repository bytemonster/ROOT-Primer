from html.parse import HTMLParser
# import HTML
import sys
import string


infilename = sys.argv[1]
# outfilename = sys.argv[2]
f = open(infilename, 'rw')
# print(f.read())

# a subclass to override the handler methods
class MyHTMLParser(HTMLParser):
    def handle_starttag(self, tag, attrs):
    	if tag=="div" 
        print("Encountered a start tag:", tag)
    def handle_endtag(self, tag):
        print("Encountered an end tag :", tag)
    def handle_data(self, data):
        print("Encountered some data  :", data)

# instantiate the parser and fed it some HTML
parser = MyHTMLParser()
parser.feed(f.read())