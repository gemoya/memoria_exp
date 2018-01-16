
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

# _w = write iops
# _r = read iops


x = np.arange(1,8)
x_labels=["1", "2", "4", "8", "16", "32", "64"]
#pod
y1_r=[979, 1893, 3030, 4078, 5129, 6063, 7022 ]
y1_w=[418, 809, 1299, 1749, 2199, 2600, 3011 ]


#host

#y2_w=[2884,2727,2541,1468,761]
#y2_r=[6724,6367,5886,3437,1761]
y2_r=[951, 1843, 3034, 4170, 5203, 6129, 6915]
y2_w=[406, 789, 1301, 1788, 2231, 2628, 2965]


#plt.plot(x, y2_r, 'r-', x, y2_w, 'b-' )

plt.bar(x-0.125, y2_w, color='r', width = 0.25)
plt.bar(x+0.125, y1_w, color='b', width = 0.25)

plt.title("Fio Test on RBD: IOdepth vs Write IOPS")
plt.ylabel('Write IOPS')
plt.xlabel('Rammp time')
plt.xticks(x, x_labels)

red_patch = mpatches.Patch(color='red', label='Host')
blue_patch = mpatches.Patch(color='blue', label='Pod')
plt.legend(handles=[red_patch,blue_patch])


plt.savefig('rbd_depth_write')
plt.show()

plt.bar(x-0.125, y2_r, color='r', width = 0.25)
plt.bar(x+0.125, y1_r, color='b', width = 0.25)

plt.title("Fio Test on RBD: IOdepth  vs Read IOPS ")
plt.ylabel('Read IOPS')
plt.xlabel('Ramp time')
plt.xticks(x, x_labels)

red_patch = mpatches.Patch(color='red', label='Host')
blue_patch = mpatches.Patch(color='blue', label='Pod')
plt.legend(handles=[red_patch,blue_patch])


plt.savefig('rbd_depth_read')
plt.show()

