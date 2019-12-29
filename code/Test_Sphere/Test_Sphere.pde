
import peasy.*;

PeasyCam cam;

PVector[][] globe; 
int total = 15;

void setup() {
  size(600, 600,P3D);
  cam = new PeasyCam(this, 500);
 // colorMode(HSB);
  globe = new PVector[total + 1][total + 1]; 
  
  
  hint(ENABLE_DEPTH_TEST);
  hint(ENABLE_DEPTH_SORT);
}

void draw() {
  background(0);
  //fill(255);
//  noStroke();
  lights();
 // translate(width/2, height/2);
 // sphere(200);
 
 rotateX( map(mouseY,0,height,0,TWO_PI));
 rotateY( map(mouseX,0,width,0,TWO_PI));
 noStroke();
  fill(255,0,0);
  //box(150);
  triangle(0,200,200,-60,-200,-60);
  
float r = 200;

/* for (int i = 0; i < total; i++) {
    float lat = map(i, 0, total, 0, PI);
    for (int j = 0; j < total; j++) {
      float lon = map(j, 0, total, 0, TWO_PI);
      float x = r * sin(lat) * cos(lon);
      float y = r * sin(lat) * sin (lon);
      float z = r * cos(lat);
      stroke(115);
     // strokeWeight(5);
      point(x, y, z);
    }
  } */
  
  
    for (int i = 0; i < total + 1; i++) {
    float lat = map(i, 0, total, 0, PI);
    for (int j = 0; j < total + 1; j++) {
      float lon = map(j, 0, total, 0, TWO_PI);
      float x = r * sin(lat) * cos(lon);
      float y = r * sin(lat) * sin (lon);
      float z = r * cos(lat);
      globe[i][j] = new PVector(x, y, z); 
      
    /*  PVector v = PVector.random3D();
      v.mult(100);
      globe[i][j].add(v); */
    }
  } 

  for (int i = 0; i < total; i++) {
  /* if(i % 2 == 0)
    {
      fill(0);
    }
    else
     fill(255); */
     
     
   // float hu = map(i, 0, total, 0, 255*6);
    // fill(hu  % 255, 255, 255);
   
   beginShape(QUAD_STRIP);
   noFill();
    for (int j = 0; j < total + 1; j++) {
      PVector v1 = globe[i][j];
      stroke(255);
      strokeWeight(1);
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z); 
    }
    endShape();
  }  
 // tint(255, 127);  // Display at half opacity
  
}
