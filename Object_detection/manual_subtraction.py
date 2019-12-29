#### Edit_me -> Code for saving video

#import cv2 #Edit_me
#import numpy as np #Edit_me



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



#cap = cv2.VideoCapture("videos/c.mp4") #Edit_me




ret, first_frame = cap.read() #Edit_me



print('ret =', ret, 'W =', first_frame.shape[1], 'H =', first_frame.shape[0], 'channel =', first_frame.shape[2]) #Edit_me
FPS= 20.0 #Edit_me
FrameSize=(first_frame.shape[1], first_frame.shape[0]) #Edit_me
fourcc = cv2.VideoWriter_fourcc(*'MJPG') #Edit_me
out = cv2.VideoWriter('bw/Video_output.avi', fourcc, FPS, FrameSize, 0) #Edit_me




first_gray = cv2.cvtColor(first_frame, cv2.COLOR_BGR2GRAY)
first_gray = cv2.GaussianBlur(first_gray, (7, 7), 0)

while True:
    ret, frame = cap.read() #Edit_me

    gray_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    gray_frame = cv2.GaussianBlur(gray_frame, (7, 7), 0)
    difference = cv2.absdiff(first_gray, gray_frame)
    _, difference = cv2.threshold(difference, 25, 255, cv2.THRESH_BINARY)


    frame = difference #Edit_me
    # Save the video
    out.write(frame) #Edit_me
    
    #cv2.imshow("First frame", first_frame) #Edit_me
    #cv2.imshow("Frame", frame) #Edit_me
    cv2.imshow("difference", difference)

    key = cv2.waitKey(30)
    if key == 27:
        break
    



cap.release()


out.release() #Edit_me


cv2.destroyAllWindows()
