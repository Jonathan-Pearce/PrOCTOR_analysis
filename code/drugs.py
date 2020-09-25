import csv

f = open('/Users/jaypearce9/Desktop/Classes/Math_410/drugs.txt')



fda = []

for line in f:
	elements = line.split()

	if len(elements) == 3:
		fda.append(elements[0].lower())
	else:
		fda.append(str(elements[0] + ' ' + elements[1]).lower())

#print fda
print len(fda)

mydrugs = []

with open('/Users/jaypearce9/Desktop/Classes/Math_410/rawDataSheet3.csv', 'rb') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    for row in spamreader:
    	#print ' '.join(row).lower()
    	#mydrugs.append(row[0].lower())
    	mydrugs.append(' '.join(row).lower())


print mydrugs
print len(mydrugs)

count = 0

for i in mydrugs:
	if i not in fda:
		print 1,',',
		count += 1
	else:
		print 0,',',
		#i = 1

print ''
print count

for i in mydrugs:
	if i not in fda:
		print i