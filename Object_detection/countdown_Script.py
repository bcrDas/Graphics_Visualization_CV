
#importing time module

import time, subprocess
'''
#program for getting input  & counting the time

timeleft= float(input("enter the count down in seconds:"))
while timeleft > 0:
    print(timeleft)      
    time.sleep(1)
    timeleft= timeleft- 1
'''

# for playing the sound
subprocess.Popen(['start','alarm.wav'], shell=True)
