newData = '/Users/jaypearce9/Downloads/20171017_pipe-delimited-export/studies.txt'

oldData = '/Users/jaypearce9/Downloads/AACT201603_pipe_delimited/clinical_study.txt'

data = '/Users/jaypearce9/Desktop/Classes/Math_410/reformatData.txt'

#mystr[-4:]



g = open('/Users/jaypearce9/Desktop/Classes/Math_410/2016ToxicDrugs2.txt','w+')

with open(data) as f:
    for line in f:
    	line = line.lower()
    	if ' toxic' in line:
    		endofLine = line[-500:]
    	#if True:
    		if ('withdrawn' in endofLine or 'terminated' in endofLine or 'suspended' in endofLine) and 'accrual' not in endofLine:
    			g.write(line)


    	
        