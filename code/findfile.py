import os

directory = '/Users/jaypearce9/Downloads/AACT201603_pipe_delimited'

for filename in os.listdir(directory):
    if filename.endswith(".txt"):
    	count = 0
    	print filename

    	with open(str(directory + '/' + filename)) as f:
    		for line in f:
    			if 'withdrawn' in line or 'terminated' in line or 'suspended' in line:
    				count += 1

    	print count