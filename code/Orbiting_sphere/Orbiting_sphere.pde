
////////Variables and constants for circle 1,2,3 and 4.//////////////

float x,y,x1, y1, x2, y2, x3, y3;
float frequency_1 = 2, frequency_2 = 4, frequency_3 = 8,f = 8;
float angle_1, angle_2, angle_3,a=70;
float radius_1 = 200, radius_2 = 100, radius_3 = 40;

////////////////////////////////////////////////////////////////////

void setup() {
  size(1000, 800, P3D);
  background(255);
  smooth();
  noStroke();
  hint(ENABLE_DEPTH_TEST);
  hint(ENABLE_DEPTH_SORT);
}

///////////////////////////////////////////////////////////////////

void draw() {
  lights();
  background(0);
  translate(width/2, height/2, -50);
 
  rotateX( map(mouseY,0,height,-TWO_PI/4,TWO_PI/4));
  rotateY( map(mouseX,0,width,0,TWO_PI)); 
  
 // line_axis(width, height);
 draw_axis();
 rotate_sphere();
  
}

///////////////////////////////////////////////////////////////////

void line_axis(int p, int q)
  {
   line(p,0,0,-q,0,0); 
   stroke(150);
   strokeWeight(6);
   line(0,q,0,0,-q,0); 
  // stroke(200);
  // strokeWeight(6);
   line(0,0,-p,0,0,q); 
   //stroke(200);
  // strokeWeight(6);
  }
  
/////////////////////////////////////////////////////////////////// 
  
  void draw_axis() {
 
  box(60);
  stroke(200, 0, 0);//red
  line(-900, 0, 0, 900, 0, 0);//x-axis
  stroke(0, 200, 0);//green
  line(0, -900, 0, 0, 900, 0);//y-axis
  stroke(0, 0, 200);//blue
  line(0, 0, -700, 0, 0, 700);//z-axis
  stroke(0, 0, 0);

  pushMatrix();//draws spheres to indicate positive side of axes
  translate(150, 0, 0);
  sphere(10);//positive x-axis
  translate(-150, 150, 0);
  sphere(10);//positive y-axis
  translate(0, -150, 150);
  sphere(10);//positive z-axis
  popMatrix(); 
  
}//end of draw_axis()
  
///////////////////////////////////////////////////////////////////

void rotate_sphere()
 {
    ///////////////////////Code for 1st circle//////////////////////////
  
 // stroke(255);
 // strokeWeight(0.5);
 noStroke();
  fill(0,255,0,20);
  //noFill();
  pushMatrix();
  //scale(80);
  sphere(200);
  //if( !keyPressed ){ sphere(200);}
  popMatrix();
  
  ////////////////////////////////////////////////////////////////////
  
  
 ///////////////////////Code for 2nd circle//////////////////////////
 a = angle_1;
 x1 = sin(radians(angle_1))*radius_1;
 y1 = cos(radians(angle_1))*radius_1;
  
  fill(255, 0, 0,50);
  //noFill();
 // stroke(255);
  noStroke();
  translate(x1, 0, y1);
  //scale(10);
  sphere(100);
  angle_1 += frequency_1;
  
 /* 
 x = 2 + sin(radians(a + 100))*radius_1;
 y = 2 + cos(radians(a + 100))*radius_1;
  
  fill(255, 122, 0,50);
  //noFill();
 // stroke(255);
  noStroke();
  translate(x, 0, y);
  //scale(10);
  sphere(50);
  a += f;
  
  */
  
  ////////////////////////////////////////////////////////////////////
  
  
 ///////////////////////Code for 3rd circle//////////////////////////
  
  x2 = sin(radians(angle_2))*radius_2;
  y2 = cos(radians(angle_2))*radius_2;
 // print(angle);
 // print("\n"); 
  
  fill(0, 0, 255,50);
  //noFill();
  //stroke(255);
  //noStroke();
  translate(x2, 0, y2);
  //scale(10);
  sphere(50);
  angle_2 += frequency_2; 
  
  ////////////////////////////////////////////////////////////////////
  
  
  ///////////////////////Code for 4th circle//////////////////////////
  
 x3 = sin(radians(angle_3))*radius_3;
 y3 = cos(radians(angle_3))*radius_3;
  
   fill(0, 255, 0,50); 
  // noFill();
   //stroke(255);
   translate(x3, 0, y3);
  //scale(10);
  sphere(20);
  angle_3 += frequency_3; 
 
  ////////////////////////////////////////////////////////////////////
 }
  
  
  


 
 
 
 
 
