'''
For cleaning CSV/TSV files of Null bytes and other control characters
usage: python tsv_cleaner.py file_to_clean
'''

import csv

import sys

def clean(filename):
	csvfile = filename
	outfile = filename+"_cleaned.tsv"
	out = csv.writer(open(outfile,"w"),delimiter='\t')
	with open(csvfile, 'rU') as f:
	    reader = csv.reader((x.replace('\0', '') for x in f),delimiter='\t', quoting=csv.QUOTE_NONE)
	    
	    for row in reader:
	        row = [x.strip() for x in row]
	        
	        if len(row)<3 or ':' in row[1] or len(row)>3:
	        	pass
	        else:
	        	out.writerow([row[0],row[1],'',row[2]])
clean(sys.argv[1])
