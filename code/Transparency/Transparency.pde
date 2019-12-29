void setup(){
  size(600,600,P3D);
}

void draw(){
  background(0);
  translate(width / 2, height / 2,100);
  //scale(80);
  lights();
  //rotateX( map(mouseY,0,height,0,TWO_PI/4));
  rotateY( map(mouseX,0,width,0,TWO_PI));
  noStroke();
  fill(255,0,0);
  triangle(0,200,-200,-30,200,-30);
  fill(0,255,0,50);
  if( !keyPressed ){ sphere(200); }
  
}
