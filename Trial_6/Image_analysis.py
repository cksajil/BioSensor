# Read Image List

from os import listdir

#imagesrc = 'Samples/SetA'
imagesrc = 'Samples/SetB'
files = listdir(imagesrc)
files = sorted(files)


print files


# Input Glucose Concentration Information

import numpy as np
#gluccose_levels = np.linspace(3.5, 12.5, 10)
gluccose_levels = np.linspace(3.5, 6.5, 4)

print gluccose_levels


# Read Images

from scipy import misc
#import matplotlib.pyplot as plt

data = []

for file in files:
    img = misc.imread(imagesrc+'/'+file)

    # The channels are Reg, Green, Blue and Transparency
    # Select the red channel

    red_component = img[:,:,0]
    
    # Flatten the array
    red_vector = red_component.flatten()

    data.append(red_vector)


# Transpose the matrix 
data = map(list, zip(*data)) 

print type(data)

import pandas as pd

#columns=gluccose_levels

result = pd.DataFrame(data, columns = gluccose_levels )
#result.to_csv('output_SetA.csv', sep=',')
result.to_csv('output_SetB.csv', sep=',')