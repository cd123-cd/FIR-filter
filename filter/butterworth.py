# import required library
import numpy as np
import scipy.signal as signal
import matplotlib.pyplot as plt

# Given
f1 = 25  # Frequency of 1st signal
f2 = 50  # Frequency of 2nd signal
N = 10  # Order of the filter

# Generate the time vector of 1 sec duration
# START CODE HERE ### (≈ 1 line of code)
# Generate 1000 samples in 1 sec
t = np.linspace(0, 1, 1000)

# Generate the signal containing f1 and f2
# START CODE HERE ### (≈ 1 line of code)
sig = np.sin(2*np.pi*f1*t) + np.sin(2*np.pi*f2*t)

# Display the signal
fig, (ax1, ax2) = plt.subplots(2, 1, sharex=True)
ax1.plot(t, sig)
ax1.set_title('25 Hz and 50 Hz sinusoids')
ax1.axis([0, 1, -2, 2])

# Design the Butterworth filter using signal.butter and output='sos'
# START CODE HERE ### (≈ 1 line of code)
sos = signal.butter(50, 35, 'lp', fs=1000, output='sos')

# Filter the signal by the filter using signal.sosfilt
# START CODE HERE ### (≈ 1 line of code)
# Use signal.sosfiltfilt to get output inphase with input
filtered = signal.sosfiltfilt(sos, sig)

# Display the output signal
ax2.plot(t, filtered)
ax2.set_title('After 35 Hz Low-pass filter')
ax2.axis([0, 1, -2, 2])
ax2.set_xlabel('Time [seconds]')
plt.tight_layout()
plt.show()