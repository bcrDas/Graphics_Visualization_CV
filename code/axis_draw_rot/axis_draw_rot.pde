
//Written by Shane Gibney
import processing.opengl.*;
boolean overRegion = false;
boolean pressed = false;
boolean button1 = true; //wave 1 on by default
boolean button2 = false;
boolean button3 = false;
float angleX = 0.0;
float angleY = 0.0;
float angleZ = 0.0;
float angleXtemp = 0.0;
float angleYtemp = 0.0;
float angleZtemp = 0.0;
float angleIncr = PI/720;
void setup() {
  //size(400, 400, OPENGL);
  size(400, 400, P3D);
}
void draw() {
  background (255, 255, 255);
  if (mouseX > 30.0 && mouseY > 30.0) { //this is the region outside the border controls
    overRegion = true;
  }
  else {
    overRegion = false;
  }
 
  beginCamera();
  camera(100, -100, 400, //camera location fixed
  0, 0, 0, // camera target
  0, 1, 0); // camera orientation
  println("angleX = ", angleX); 
  println("angleXtemp = ", angleXtemp); 
  if (button1) {
    rotateX(angleX + angleXtemp);
    angleX += angleIncr;
    angleXtemp = angleX;
  } 
  else {
    rotateX(angleX + angleXtemp);
    angleXtemp = angleX;
  }
  if (button2) {
    rotateY(angleY + angleYtemp);
    angleY += angleIncr;
    angleYtemp = angleY;
  } 
  else {
    rotateY(angleY + angleYtemp);
    angleYtemp = angleY;
  }
  if (button3) {
    rotateZ(angleZ + angleZtemp);
    angleZ += angleIncr;
    angleZtemp = angleZ;
  } 
  else {
    rotateZ(angleZ + angleZtemp);
    angleZtemp = angleZ;
  }
  endCamera();
 
  box(50);
 
  stroke(200, 0, 0);//red
  line(-200, 0, 0, 200, 0, 0);//x-axis
  stroke(0, 200, 0);//green
  line(0, -200, 0, 0, 200, 0);//y-axis
  stroke(0, 0, 200);//blue
  line(0, 0, -200, 0, 0, 200);//z-axis
  stroke(0, 0, 0);
 
  pushMatrix();//draws spheres to indicate positive side of axes
  translate(150, 0, 0);
  sphere(5);//positive x-axis
  translate(-150, 150, 0);
  sphere(5);//positive y-axis
  translate(0, -150, 150);
  sphere(5);//positive z-axis
  popMatrix();
 
  hint(DISABLE_DEPTH_TEST);// Disable Depth Test
  camera();
  stroke(0, 0, 0);//rect edge colour
  fill(#919293);
  rect(0, 0, width, 30);//grey horizontal top border
  textSize(12);
  if (button1) {
    fill(#BFE1F0);//rect colour
    rect(0, 0, 55, 30, 7);
  }
  else {
    fill(#6FCBF5);//rect colour
    rect(0, 0, 55, 30, 7);
  }
  fill(0, 0, 0);//text colour
  text("RotateX", 7, 20); 
  if (button2) {
    fill(#BFE1F0);//rect colour
    rect(55, 0, 55, 30, 7);
  } 
  else {
    fill(#6FCBF5);//rect colour
    rect(55, 0, 55, 30, 7);
  }
  fill(0, 0, 0);//text colour
  text("RotateY", 62, 20);
 
  if (button3) {
    fill(#BFE1F0);//rect colour
    rect(110, 0, 80, 30, 7);
  } 
  else {
    fill(#6FCBF5);//rect colour
    rect(110, 0, 80, 30, 7);
  }
  fill(0, 0, 0);//text colour
  text("RotateZ", 125, 20); 
 
  hint(ENABLE_DEPTH_TEST);// Enable Depth Test
}//end of draw()
 
void mousePressed() {
  if (overRegion) {
    pressed = true;
  } 
  else {
    pressed = false;
  }
  if (mouseButton == LEFT) {
    if (mouseX > 0 && mouseX < 54.9 && mouseY > 0 && mouseY < 30) {
      button1 = !button1;
    }
    if (mouseX > 55 && mouseX < 110 && mouseY > 0 && mouseY < 30) {
      button2 = !button2;
    }
    if (mouseX > 110 && mouseX < 190 && mouseY > 0 && mouseY < 30) {
      button3 = !button3;
    }
  }
}
void mouseReleased() {
  pressed = false;
}
