
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

# _w = write iops
# _r = read iops


x = np.arange(1,7)
x_labels=["10s", "20s", "30s", "40s", "50s", "60s"]
#pod
y1_w=[2918, 2915, 2950, 2950, 2889, 2944]
y1_r=[6823, 6799, 6878, 6878, 6736, 6866]

#host

#y2_w=[2884,2727,2541,1468,761]
#y2_r=[6724,6367,5886,3437,1761]

y2_w=[2894, 2947, 2928, 2928, 2934, 2921]
y2_r=[6739, 6874, 6828, 6827, 6843, 6812]

#plt.plot(x, y2_r, 'r-', x, y2_w, 'b-' )

plt.bar(x-0.125, y2_w, color='r', width = 0.25)
plt.bar(x+0.125, y1_w, color='b', width = 0.25)

plt.title("Fio Test on RBD: Ramp time vs Write IOPS")
plt.ylabel('Write IOPS')
plt.xlabel('Rammp time')
plt.xticks(x, x_labels)

red_patch = mpatches.Patch(color='red', label='Host')
blue_patch = mpatches.Patch(color='blue', label='Pod')
plt.legend(handles=[red_patch,blue_patch])


plt.savefig('rbd_rt_write')
plt.show()

plt.bar(x-0.125, y2_r, color='r', width = 0.25)
plt.bar(x+0.125, y1_r, color='b', width = 0.25)

plt.title("Fio Test on RBD: Ramp time vs Read IOPS ")
plt.ylabel('Read IOPS')
plt.xlabel('Ramp time')
plt.xticks(x, x_labels)

red_patch = mpatches.Patch(color='red', label='Host')
blue_patch = mpatches.Patch(color='blue', label='Pod')
plt.legend(handles=[red_patch,blue_patch])


plt.savefig('rbd_rt_read')
plt.show()

