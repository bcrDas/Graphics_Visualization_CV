/*


PShape my_sphere;
ArrayList<PVector> vertices = new ArrayList<PVector>();
 
void setup(){
  size(800, 600, P3D);
  frameRate(60);
  smooth();
  sphereDetail(10);
  fill(255,0,0);
  my_sphere = createShape(SPHERE, 100);
}
 
void draw(){
  background(255,255,255);
  pushMatrix();
  translate(width/2, height/2);
  //rotateZ(millis() * 0.0001 * TWO_PI);
 //rotateY(millis() * 0.0001 * TWO_PI);
  
  
  rotateX( map(mouseY,0,height,0,TWO_PI));
  rotateY( map(mouseX,0,width,0,TWO_PI));
  
  
  draw_sphere();
 draw_points();
 //spherea();
  vertices.clear();
  popMatrix();
}
 
void draw_sphere(){
  //fill(255,0,0);
  //triangle(0,200,-200,-30,200,-30);
  shape(my_sphere);
  my_sphere.setVisible(true);
} 


void draw_points(){
  getVertices(my_sphere, vertices);
  for(int i=0; i < vertices.size(); i++){
    PVector vertex = vertices.get(i);
    float x = vertex.x;
    float y = vertex.y;
    float z = vertex.z;
    pushMatrix();
    translate(x, y, z);
    if(i == 60)
    {
    sphere(30);
    }
    
    popMatrix();
  }
}
 
void getVertices(PShape shape, ArrayList<PVector> vertices){
  for(int i = 0 ; i < shape.getVertexCount(); i++){
    PVector vertex = shape.getVertex(i);
    vertices.add(vertex);
  }
}


*/






/*
float a1; 
 
void setup() {
  size(300, 300, P3D);
  background(111);
}
 
void draw() { 
  background(111);
  lights();
  translate(width/2, height/2); 
  //rotateX(a1-.2); 
  //rotateY(a1);
    rotateZ(a1);
  // interactive or fixed version
  if(!mousePressed){
    longitudeSphere(100, 25, 25);
  } else {
    longitudeSphere(100, (int)(30 * mouseX/(float)width) + 1, (int)(30 * mouseY/(float)height) + 1);
  }
  a1+=.01;
}
//
 
void longitudeSphere( int r, int vring, int hring ){
  // based on longitude sphere by vrtxt and Chrisir
  // this method tends to leave open top and bottom end-caps with a single point on one end
  // https:// forum.processing.org/two/discussion/20688/plotting-points-on-a-sphere
  int vstep = r/max(vring,1); // prevent divide-by-zeros if dragging out of window
  int hstep = (r*2)/max(hring,1);
  PVector point = new PVector();
  PVector gear0 = new PVector(r, r, r); 
  float Theta;
  float u;
  for (float j = 0; j < r; j+=vstep) {
    Theta = (TAU/100)*j; 
    for (float i = 0; i <= r; i+=hstep) {
      u = map (i, 0, r, -1, 1);   
      point.x =  gear0.x*cos(Theta)*sqrt(1-(u*u));
      point.y =  gear0.y*sin(Theta)*sqrt(1-(u*u)); 
      point.z =  gear0.z*u;
      pushMatrix();
      translate(point.x, point.y, point.z);
       fill(255, 0, 0);
      noStroke(); 
      if( j == 4)
      {
      fill(0,255,255);
      sphere(15);
      }
      else 
      {
     
      //sphere(5);
      }
      popMatrix();
    }
  }
}

*/





import peasy.*;
PeasyCam cam;
PVector sph; 
int size = 75;
 
void setup(){
  size(400, 400, P3D);
  noFill();
  cam = new PeasyCam(this, 200);
  sph = new PVector(0,0,0);
}
 
void draw(){
  background(192);
  translate(sph.x,sph.y,sph.z);
  sphere(size);
  pushStyle();
    strokeWeight(4);
    stroke(255,0,0);
    fill(255,0,0,64);
    ellipse(0,0,size*2 +1,size*2+1);
  popStyle(); 
}
 
void randomTranslate(){
  sph.x = random(-size,size);
  sph.y = random(-size,size);
  sph.z = 0;
}
 
void keyPressed(){
  cam.reset();
  randomTranslate();
}
