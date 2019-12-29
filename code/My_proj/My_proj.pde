import peasy.*;

PeasyCam cam;
int size = 200;

void setup(){
  size(600,600,P3D);
 // cam = new PeasyCam(this,500);
  hint(ENABLE_DEPTH_TEST);
  hint(ENABLE_DEPTH_SORT);
  
}

void draw(){
  background(0);
  translate(width / 2, height / 2,100);
  //scale(80);
  lights();
  
  rotateX( map(mouseY,0,height,0,TWO_PI));
  rotateY( map(mouseX,0,width,0,TWO_PI));
  //rotateZ( map(mouseX,0,width,0,TWO_PI));
  
 sphere();
  strokeWeight(4);
    stroke(255,0,0);
    fill(255,0,0,64);
    ellipse(0,0,size*2 +1,size*2+1);
  line();
  
}

void sphere()
 {
  // background(0);
  //translate(width / 2, height / 2,100);
  //scale(80);
  //lights();
  
 // rotateX( map(mouseY,0,height,0,TWO_PI/4));
  //rotateY( map(mouseX,0,width,0,TWO_PI));
  noStroke();
  fill(255,0,0);
  triangle(0,200,-200,-30,200,-30);
  fill(150,255,0,128);
  if( !keyPressed ){ sphere(200); }
 }
 
 
 void line()
  {
   line(300,0,0,-300,0,0); 
   stroke(150);
   strokeWeight(6);
   line(0,300,0,0,-300,0); 
  // stroke(200);
  // strokeWeight(6);
   line(0,0,-300,0,0,300); 
   //stroke(200);
  // strokeWeight(6);
  }
