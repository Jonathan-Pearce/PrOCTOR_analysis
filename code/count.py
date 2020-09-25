newData = '/Users/jaypearce9/Downloads/20171017_pipe-delimited-export/studies.txt'

oldData = '/Users/jaypearce9/Downloads/AACT201603_pipe_delimited/clinical_study.txt'

data = '/Users/jaypearce9/Desktop/Classes/Math_410/reformatData.txt'



#g = open('/Users/jaypearce9/Desktop/Classes/Math_410/2016ToxicDrugs.txt','w+')

i = 1

with open(data) as f:
    for line in f:
    	if 'due to toxic' in line:
    	#if True:
    		if 'withdrawn' in line or 'terminated' in line or 'suspended' in line:
    		#g.write(line)
    			print i
    			i+=1


    	
        