
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

# _w = write iops
# _r = read iops


x = np.arange(1,6)
x_labels=["4KB", "8KB", "16KB", "32KB", "64KB"]
#pod
y1_w=[2848, 2720, 2388, 1495, 764]
#y2_r=[]

#host

#y2_w=[2884,2727,2541,1468,761]
#y2_r=[6724,6367,5886,3437,1761]

y2_w=[2923,2727,2545,1498,764]
y2_r=[6724,6367,5886,3437,1761]

#plt.plot(x, y2_r, 'r-', x, y2_w, 'b-' )

plt.bar(x-0.125, y2_w, color='r', width = 0.25)
plt.bar(x+0.125, y1_w, color='b', width = 0.25)

plt.title("Fio Test on RBD: Block size vs IOPs")
plt.ylabel('IOPs')
plt.xlabel('block size')
plt.xticks(x, x_labels)

red_patch = mpatches.Patch(color='red', label='Host')
blue_patch = mpatches.Patch(color='blue', label='Pod')
plt.legend(handles=[red_patch,blue_patch])


plt.savefig('bars')
plt.show()
