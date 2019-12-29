#### Edit_me -> Code for saving video


#import numpy as np #Edit_me
#import cv2 #Edit_me


# import the necessary packages
import numpy as np #Edit_me
import argparse #Edit_me
import imutils #Edit_me
import time #Edit_me
import cv2 #Edit_me
import os #Edit_me



# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser() #Edit_me
ap.add_argument("-i", "--input", required=True,
	help="path to input video file") #Edit_me
args = vars(ap.parse_args()) #Edit_me

# initialize the video stream and pointer to output video file
cap = cv2.VideoCapture(args["input"]) #Edit_me

ret, frame = cap.read() #Edit_me
print('ret =', ret, 'W =', frame.shape[1], 'H =', frame.shape[0], 'channel =', frame.shape[2]) #Edit_me
FPS= 20.0 #Edit_me
FrameSize=(frame.shape[1], frame.shape[0]) #Edit_me
fourcc = cv2.VideoWriter_fourcc(*'MJPG') #Edit_me
out = cv2.VideoWriter('bw/Video_output.avi', fourcc, FPS, FrameSize, 0) #Edit_me




#cap = cv2.VideoCapture("videos/videoplayback.avi") #Edit_me

subtractor = cv2.createBackgroundSubtractorMOG2(history=100, varThreshold=50, detectShadows=False)

while True:
    ret, frame = cap.read() #Edit_me
    


    mask = subtractor.apply(frame)


    frame = mask #Edit_me
    # Save the video
    out.write(frame) #Edit_me


    #cv2.imshow("Frame", frame) #Edit_me
    #cv2.imshow("mask", mask)
    cv2.imshow("mask", mask)




    key = cv2.waitKey(30)
    if key == 27:
        break

cap.release()
out.release() #Edit_me
cv2.destroyAllWindows()
