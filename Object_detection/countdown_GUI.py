#This is a simple program for count down timer
#importing tkinter module for GUI creation:


# (For select_video) b/w -> resize


from tkinter import *              
from tkinter import ttk, font
import time,subprocess

# import the necessary packages
import numpy as np #Edit_me
import argparse #Edit_me
import imutils #Edit_me
#import time #Edit_me
import cv2 #Edit_me
import os #Edit_me
import moviepy.editor as mp
from PIL import Image
from PIL import ImageTk
#import tkFileDialog  #Edit_me
from tkinter import filedialog #Edit_me
#import tkinter.filedialog #Edit_me
#import cv2

root = Tk()

#string variable for displaying output:
#count= StringVar()

#defining timer program:  
def select_video():

    # grab a reference to the image panels
    global panelA,panelB

    # open a file chooser dialog and allow the user to select an input
    # image
    path = filedialog.askopenfilename() #Edit_me



    cap = cv2.VideoCapture(path) #Edit_me

    clip = mp.VideoFileClip(path)
    clip_resized = clip.resize(height=260) # make the height 360px ( According to moviePy documenation The width is then computed so that the width/height ratio is conserved.)
    clip_resized.write_videofile("resize/c_out.mp4");
    path = filedialog.askopenfilename() #Edit_me
    cap = cv2.VideoCapture(path) #Edit_me
    
    ret, frame = cap.read() #Edit_me
    print('ret =', ret, 'W =', frame.shape[1], 'H =', frame.shape  [0], 'channel =', frame.shape[2]) #Edit_me
    FPS= 20.0 #Edit_me
    FrameSize=(frame.shape[1], frame.shape[0]) #Edit_me
    fourcc = cv2.VideoWriter_fourcc(*'MJPG') #Edit_me
    out = cv2.VideoWriter('bw/Video_output.avi', fourcc, FPS, FrameSize, 0) #Edit_me

    #cap = cv2.VideoCapture("videos/videoplayback.avi") #Edit_me

    subtractor = cv2.createBackgroundSubtractorMOG2(history=100, varThreshold=50, detectShadows=False)
    #print("Done")

    while True:

        ret, frame = cap.read() #Edit_me

        mask = subtractor.apply(frame)
        
        frame = mask #Edit_me
        # Save the video
        out.write(frame) #Edit_me
        
        #cv2.imshow("Frame", frame) #Edit_me
        #cv2.imshow("mask", mask)

        key = cv2.waitKey(30)
        if key == 27:
            break

    cap.release()







def select_image():
    # grab a reference to the image panels
    global panelA, panelB

    # open a file chooser dialog and allow the user to select an input
    # image
    path = filedialog.askopenfilename() #Edit_me

    # ensure a file path was selected
    if len(path) > 0:
        # load the image from disk, convert it to grayscale, and detect
        # edges in it
        image = cv2.imread(path)
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        edged = cv2.Canny(gray, 50, 100)
        # OpenCV represents images in BGR order; however PIL represents
        # images in RGB order, so we need to swap the channels
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)                                              
        #cv2.imwrite("bw/img.jpg",edged)
        #cv2.imwrite("bw/img.jpg",edged)

        cv2.imwrite("bw/img.jpg",edged)
    


def me():
    print("Hi me!!!")


#defining widgets for tkinter:

#x1Lab = Label (root, text="Enter the countdowm in seconds:")
select_video = Button(root,text="Video_processing",command= select_video)

select_image = Button(root,text="Image_processing",command= select_image)

me = Button(root,text="Image_processing",command= me)



#for getting input from user:
#x= Entry(root)
#x1Lab.grid(row=1,column=0)
#x.grid(row=1,column=2)

#for executing 
select_video.grid(row=2)
select_image.grid(row=3)
me.grid(row=4)

#for app name: 
root.wm_title("Count down Timer")

root.mainloop()

cap.release()
cv2.destroyAllWindows()
   
            
