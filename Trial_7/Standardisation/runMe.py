import numpy as np
import pandas as pd
from scipy import misc
from pandas import ExcelWriter
import matplotlib.pyplot as plt

width  				= 		8
height 				= 		width / 1.618
labelsize 			= 		12

plt.rc('font', family='serif')
plt.rc('text', usetex=True)
plt.rc('xtick', labelsize = labelsize)
plt.rc('ytick', labelsize = labelsize)
plt.rc('axes', labelsize  = labelsize)

data 				= 		pd.read_excel(open('Input/list.xls','rb'), index=False)
datafiles      		= 		data['FileName']
datares 			=		data
meanreds 			=		[]

for file in datafiles:
    img 			= 		misc.imread('Input/'+file)
    meanreds.append(np.mean(img[:,:,0].flatten()))

def renamer(fname):
  return fname.split('.')[0][-2:]

datares['MeanRed']	=	  	meanreds
writer 				= 		ExcelWriter('Output/Output.xlsx')
datares.to_excel(writer,'Sheet1')
writer.save()



data5 				=		datares[datares['GlucoseConc(mmol/l)']==5.0]
fig, ax 			= 		plt.subplots()
xticks 				= 		map(renamer, data5['FileName'].values)
fig.subplots_adjust(left=.16, bottom=.20, right=.99, top=.97)
plt.bar(xticks, data5['MeanRed'], color='k')
plt.xticks(rotation	=	'vertical')
plt.xlabel('Trials')
plt.ylabel('Mean Red Component')
plt.legend('5')
plt.show()
fig.set_size_inches(width, height)
fig.savefig('Output/Glucose5.png', dpi = 600)


data9 				=		datares[datares['GlucoseConc(mmol/l)']==9.0]
fig, ax 			= 		plt.subplots()
xticks 				= 		map(renamer, data9['FileName'].values)
fig.subplots_adjust(left=.16, bottom=.20, right=.99, top=.97)
plt.bar(xticks, data9['MeanRed'], color='k')
plt.xticks(rotation	=	'vertical')
plt.xlabel('Trials')
plt.ylabel('Mean Red Component')
plt.legend('9')
plt.show()
fig.set_size_inches(width, height)
fig.savefig('Output/Glucose9.png', dpi = 600)




