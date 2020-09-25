import xml.etree.ElementTree
tree = xml.etree.ElementTree.parse('/Users/jaypearce9/Downloads/full_database.xml')

#data = '/Users/jaypearce9/Desktop/Classes/Math_410/reformatData.txt'

#tree = xml.etree.ElementTree.parse('/Users/jaypearce9/Desktop/Classes/Math_410/sample_database.xml')

e = tree.getroot()



#for atype in e.findall('COMMON'):
 #   print(atype.get('common'))


#for elem in e.iter():
	#print elem.tag, elem.attrib

#for application in e.findall('drug'):
#	name = application.find('name').text
#	print name
counter = 0
fdaDrugs = []

print 'here'
for child_of_root in e:
	print child_of_root.tag



if False:
	for child_of_root in e:
		for child_of_e in child_of_root:
			for i in child_of_e.itertext():
				if child_of_e.tag == '{http://www.drugbank.ca}name':
					fdaDrugs.append(i)
					counter += 1
					if counter % 1 == 0:
						print i, ' ',counter

#for elem in tree.iter():
#	print elem.attrib

#for i in e.itertext():
#	print(i)

print fdaDrugs
print len(fdaDrugs)


