//////////////////////////////////////////////////////// Library part ///////////////////////////////////////////////////////

//import peasy.*;

//import processing.opengl.*;



/////////////////////////////Variables and constants for circle 1, 2, 3, 4..... //////////////////////////////////////////////

//PeasyCam cam;

//int size_screenX = 1000, size_screenY = 800, bg_color;

float x10, y10, x11, y11, x12, y12, x13, y13, x14, y14, x15, y15, x16, y16, x17, y17;
float frequency_11 = 2, frequency_12 = 4, frequency_13 = 8, f = 8;
float angle_11, angle_12, angle_13, angle_17;
float radius_11 = 200, radius_12 = 100, radius_13 = 40, radius_17 = 70;


//boolean overRegion = false;
//boolean pressed = false;
//boolean button1 = true; //wave 1 on by default
//boolean button2 = false;
//boolean button3 = false;
//float angleX = 0.0;
//float angleY = 0.0;
//float angleZ = 0.0;
//float angleXtemp = 0.0;
//float angleYtemp = 0.0;
//float angleZtemp = 0.0;
//float angleIncr = PI/720;



//////////////////////////////////////////////////  One time loop   ////////////////////////////////////////////////////////////

void setup() {

  clear();
  size(1000, 800, P3D);
  //cam = new PeasyCam(this, 500);
  smooth();
  noStroke();
  hint(ENABLE_DEPTH_TEST);
  hint(ENABLE_DEPTH_SORT);
  
}  // End of setup()







////////////////////////////////////////////////////  Infinite loop ///////////////////////////////////////////////////////////

void draw() {

  lights();
  background(0);
  translate(width/2, height/2, -50);


  movement();
 // clk_opt();
  rotate_sphere_3_L2();
  
} // End of draw()


















/////////////////////////////////////////////////////////   Functions  /////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void rotate_sphere_3_L2()
{

  ///////////////////////////////////////////////////////////////////

  host_sphere();

  ///////////////////////////////////////////////////////////////////

 // moving_triangle(x10, y10, x11, y11, x13, y13);

  ///////////////////////////////////////////////////////////////////

  x10 = sin(radians(angle_11))*radius_11;
  y10 = cos(radians(angle_11))*radius_11;

  translate(x10, y10, 0);
  sphere_client_L1(120, 120, 120, 70, 20, 255, 0, 0, 200);

 // angle_11 += frequency_11; 

  ///////////////////////////////////////////////////////////////////


  x11 = sin(radians(angle_11 + 120))*radius_11;
  y11 = cos(radians(angle_11 + 120))*radius_11;

  //angle_1 += frequency_1;

  translate(x11, y11, 0);
  sphere_client_L1(0, 0, 0, 0, 0, 255, 0, 0, 50); 

  ///////////////////////////////////////////////////////////////////


  x12 = sin(radians(angle_11 + 180))*radius_11;
  y12 = cos(radians(angle_11 + 180))*radius_11;

  //angle_1 += frequency_1;

  translate(x12, y12, 0);
  sphere_client_L1(120, 120, 120, 70, 20, 0, 255, 0, 200);

  ///////////////////////////////////////////////////////////////////


  x13 = sin(radians(angle_11 + 240))*radius_11;
  y13 = cos(radians(angle_11 + 240))*radius_11; 

  //angle_1 += frequency_1;

  translate(x13, y13, 0);
  sphere_client_L1(0, 0, 0, 0, 0, 255, 0, 0, 50);

  ///////////////////////////////////////////////////////////////////


  x14 = sin(radians(angle_11 + 300))*radius_11;
  y14 = cos(radians(angle_11 + 300))*radius_11;

  //angle_1 += frequency_1; 

  translate(x14, y14, 0);
  sphere_client_L1(120, 120, 120, 70, 20, 0, 0, 255, 200); 

  ///////////////////////////////////////////////////////////////////


  /* x15 = sin(radians(angle_11 + 360))*radius_11;
   y15 = cos(radians(angle_11 + 360))*radius_11;*/

  //angle_1 += frequency_1;

  /* translate(x15, y15, 0);
   sphere_client_L1(0, 0, 0, 0, 0, 255, 0, 0, 50); */

  ///////////////////////////////////////////////////////////////////
  
  
  
}    // End of rotate_sphere_3_1stL()






///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void movement()
{

  rotateX( map(mouseY, 0, height, 0, TWO_PI));
  rotateY( map(mouseX, 0, width, 0, TWO_PI));
  
  
}  // End of movement()







//////////////////////////////////////////////////////// Code for host/center sphere ///////////////////////////////////////////////////

void host_sphere()
{



  // stroke(255);
  // strokeWeight(0.5);
  noStroke();
  fill(255, 255, 255, 100);
  //noFill();
  pushMatrix();
  //scale(80);
  // sphere(200);
  if ( !keyPressed ) { 
    sphere(200);
  }

  draw_axis(400, 300, 400, 20);
  draw_ellipse(200);
  popMatrix();
}  // End of host_sphere()






//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void sphere_client_L1(float ap_x, float ap_y, float ap_z, float c_sphere_rad, float shape_size, int r, int g, int b, int transparency)
{

  // px = sin(radians(angle)) * h_sphere_rad ;
  // py = cos(radians(angle)) * h_sphere_rad ;

  fill(r, g, b, transparency);
  //noFill();
  // stroke(255);
  noStroke();
  //stroke(50);
  //translate(px, py, pz);
  //scale(10);
  sphere(c_sphere_rad);

  draw_axis(ap_x, ap_y, ap_z, shape_size);
  draw_ellipse(c_sphere_rad);


  //angle += freq;
} // End of sphere_client_L1()






////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void draw_axis(float x, float y, float z, float shape_size) {

  fill(0);
  sphere(shape_size);

  stroke(200, 0, 0);//red
  line(- x, 0, 0, x, 0, 0);//x-axis

  stroke(0, 200, 0);//green
  line(0, - y, 0, 0, y, 0);//y-axis

  stroke(0, 0, 200);//blue
  line(0, 0, - z, 0, 0, z);//z-axis

  stroke(0, 0, 0);
}    //  End of draw_axis_L1()






///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void draw_ellipse(float size)
{


  //strokeWeight(4);
  stroke(255, 200, 100);
  fill(0, 0, 0, 0);
  ellipse(0, 0, size*2 +1, size*2+1);

  // line();
}  // End of draw_ellipse() 







//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void moving_triangle(float px1, float py1, float px2, float py2, float px3, float py3)
{
  stroke(0);
  strokeWeight(5);
  fill(255, 0, 0);
  beginShape();
  vertex(px1, py1, px2, py2);
  vertex(px2, py2, px3, py3);
  vertex(px3, py3, px1, py1);
  endShape(CLOSE);

  strokeWeight(1); // Making stroke width normal
}   // End of moving_triangle()






////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
void clk_opt()
{
//Written by Shane Gibney


 
  beginCamera();
  camera(100, -100, 400, //camera location fixed
  0, 0, 0, // camera target
  0, 1, 0); // camera orientation
/*  println("angleX = ", angleX); 
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


*/
 
 
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
