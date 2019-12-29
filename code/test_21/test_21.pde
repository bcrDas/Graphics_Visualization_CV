
////////Variables and constants for circle 1,2,3 and 4.//////////////

float x,y,x1, y1, x2, y2, x3, y3,x4,y4,x5,y5,x6,y6,x7,y7;
float frequency_1 = 2, frequency_2 = 4, frequency_3 = 8,f = 8;
float angle_1, angle_2, angle_3,a= 800;
float radius_1 = 200, radius_2 = 100, radius_3 = 40;

////////////////////////////////////////////////////////////////////

void setup() {
  size(1000, 800, P3D);
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
 
  rotateX( map(mouseY,0,height,0,TWO_PI));
  rotateY( map(mouseX,0,width,0,TWO_PI)); 
  
 // line_axis(width, height);
 draw_axis();
 rotate_sphere_3_1stL();
 //rotate_sphere_2();
  
}

///////////////////////////////////////////////////////////////////
  
  void draw_axis() {
 
  //box(60);
  stroke(200, 0, 0);//red
  line(-400, 0, 0, 400, 0, 0);//x-axis
  stroke(0, 200, 0);//green
  line(0, -300, 0, 0, 300, 0);//y-axis
  stroke(0, 0, 200);//blue
  line(0, 0, -400, 0, 0, 400);//z-axis
  stroke(0, 0, 0);

 /* pushMatrix();//draws spheres to indicate positive side of axes
  translate(150, 0, 0);
  sphere(10);//positive x-axis
  translate(-150, 150, 0);
  sphere(10);//positive y-axis
  translate(0, -150, 150);
  sphere(10);//positive z-axis
  popMatrix(); */
  
}//end of draw_axis()
  
/////////////////////////////////////////////////////////////////// 
  
   void draw_axis_test(float x, float y) {
 
  fill(0);
 // box(20);
 //sphere(10);
  stroke(200, 0, 0);//red
  line(-120, 0, 0, 120, 0, 0);//x-axis
  stroke(0, 200, 0);//green
  line(0, -120, 0, 0, 120, 0);//y-axis
  stroke(0, 0, 200);//blue
  line(0, 0, -120, 0, 0, 120);//z-axis
  stroke(0, 0, 0);
  
}//end of draw_axis()
  
///////////////////////////////////////////////////////////////////
  
  void draw_ellipse(float size)
  {
  //strokeWeight(4);
    stroke(255,200,100);
    fill(0,0,0,0);
    ellipse(0,0,size*2 +1,size*2+1);
 // line();
  }
  
  
///////////////////////////////////////////////////////////////////

void rotate_sphere_3_1stL()
 {
    ///////////////////////Code for 1st circle//////////////////////////
  
 // stroke(255);
 // strokeWeight(0.5);
 noStroke();
  fill(255,200,150,20);
  //noFill();
  pushMatrix();
  //scale(80);
 // sphere(200);
  if( !keyPressed ){ sphere(200);}
  draw_ellipse(200);
  popMatrix(); 
  
  ////////////////////////////////////////////////////////////////////


/*beginShape();
stroke(0);
vertex(x1,y1);
vertex(x2,y2);
vertex(x4, y4);
vertex(x1, y1);
endShape(CLOSE);*/

  
 ///////////////////////Code for 2nd circle//////////////////////////
 
/*line(0,0,x1,y1);
line(0,0,x,y);
//line(0,0,x2,y2);
line(0,0,x3,y3);
//line(0,0,x4,y4);
//line(0,0,x5,y5); */
stroke(0);
strokeWeight(5);
fill(255,0,0);
beginShape();
/*line(x1,y1,x,y);
line(x,y,x3,y3);
line(x3,y3,x1,y1);*/
vertex(x1,y1,x,y);
vertex(x,y,x3,y3);
vertex(x3,y3,x1,y1);
endShape(CLOSE);
strokeWeight(1);
 
 a = angle_1;
 x1 = sin(radians(angle_1))*radius_1;
 y1 = cos(radians(angle_1))*radius_1;
  
  fill(255, 0, 0,50);
  //noFill();
 // stroke(255);
  noStroke();
  translate(x1, y1, 0);
  //scale(10);
  sphere(70);
  draw_ellipse(70);
  angle_1 += frequency_1;
  
  draw_axis_test(x1,y1);
 /* fill(0);
  box(20);
  stroke(200, 0, 0);//red
  line(-x1, 0, 0, x1, 0, 0);//x-axis
  stroke(0, 200, 0);//green
  line(0, -y1, 0, 0, y1, 0);//y-axis
  stroke(0, 0, 200);//blue
  line(0, 0, -170, 0, 0, 170);//z-axis
  stroke(0, 0, 0); */

 /* pushMatrix();//draws spheres to indicate positive side of axes
  translate(150, 0, 0);
  sphere(10);//positive x-axis
  translate(-150, 150, 0);
  sphere(10);//positive y-axis
  translate(0, -150, 150);
  sphere(10);//positive z-axis
  popMatrix();  */
  
  
  
 
 x = sin(radians(a + 120))*radius_1;
 y = cos(radians(a + 120))*radius_1;
// println(x);
 //println(y);
 //println("\n");
  fill(255, 122, 0,50);
  //noFill();
 // stroke(255);
  noStroke();
  translate(x, y, 0);
  //scale(10);
   //a += f;
  sphere(0);
  //angle_1 += frequency_1;
  
  
  
 x2 = sin(radians(a + 180))*radius_1;
 y2 = cos(radians(a + 180))*radius_1;
  fill(0,255,0,50);
  //noFill();
 // stroke(255);
  noStroke();
  translate(x2, y2, 0);
  //scale(10);
   //a += f;
  sphere(70);
  draw_ellipse(70);
  //angle_1 += frequency_1; 
  
  draw_axis_test(x2,y2);
/*  fill(0);
  box(20);
  stroke(200, 0, 0);//red
  line(-x2, 0, 0, x2, 0, 0);//x-axis
  stroke(0, 200, 0);//green
  line(0, -y2, 0, 0, y2, 0);//y-axis
  stroke(0, 0, 200);//blue
  line(0, 0, -170, 0, 0, 170);//z-axis
  stroke(0, 0, 0); */
  
 
 
 x3 = sin(radians(a + 240))*radius_1;
 y3 = cos(radians(a + 240))*radius_1;
 //println(x2);
 //println(y2);
 //println("\n");
  fill(255,0, 122,50);
  //noFill();
 // stroke(255);
  noStroke();
  translate(x3, y3, 0);
  //scale(10);
   //a += f;
  sphere(0);
  //angle_1 += frequency_1;
  
  x4 = sin(radians(a + 300))*radius_1;
 y4 = cos(radians(a + 300))*radius_1;
 //println(x2);
 //println(y2);
 //println("\n");
  fill(0,0, 255,50);
  //noFill();
 // stroke(255);
  noStroke();
  translate(x4, y4, 0);
  //scale(10);
   //a += f;
  sphere(70);
  draw_ellipse(70);
  //angle_1 += frequency_1; 
  
  
  draw_axis_test(x4,y4);
 /* fill(0);
  box(20);
  stroke(200, 0, 0);//red
  line(-x4, 0, 0, x4, 0, 0);//x-axis
  stroke(0, 200, 0);//green
  line(0, -y4, 0, 0, y4, 0);//y-axis
  stroke(0, 0, 200);//blue
  line(0, 0, -170, 0, 0, 170);//z-axis
  stroke(0, 0, 0); */
  
  
 x5 = sin(radians(a + 360))*radius_1;
 y5 = cos(radians(a + 360))*radius_1;
// println(x2);
 //println(y2);
 //println("\n");
  fill(255,0, 122,50);
  //noFill();
 // stroke(255);
  noStroke();
  translate(x5, 0, y5);
  //scale(10);
   //a += f;
  sphere(0);
  //angle_1 += frequency_1;
 } 
 
 
 ///////////////////////////////////////////////////////////////////
 
 
  

 
 ///////////////////////////////////////////////////////////////////
