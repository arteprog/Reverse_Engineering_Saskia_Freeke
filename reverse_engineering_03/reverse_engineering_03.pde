float m, w;
color clib[] = { #FF6644, #BA00FF, #FF0046, #5DB9B6 };

void setup() {
  size(600, 600);
  m = width/6.0;
  w = (((2/3.0)*width)/3.0);
  noLoop();
}

void draw() {
  background(0);
  stroke(255);
  noFill();
  strokeWeight(7);
  for (int i=0; i < 3; i++) {
    for (int j=0; j < 3; j++) {
      pushMatrix();
      translate( m + (i*w), m + (j*w) );
      module( w );
      popMatrix();
    }
  }
}

void module( float w ) {
  float mm = 0.2 * w;
  float l = (w * 0.6)/2;
  for (int i=0; i < 2; i++) {
    for (int j=0; j < 2; j++) {
      pushMatrix();
      translate(mm + i*l, mm + j*l);
      int n = round( random( -0.499, 4.499 ) );
      for (int I=0; I < n; I++) {
        submodule(l);
      }
      popMatrix();
    }
  }
}

void submodule( float w ) {
  int s = round( random( -0.499, 2.499 ) );
  stroke(clib[floor( random( 0, 4) )]);
  switch(s) {
  case 0: 

    line(0, w/2, w, w/2);
    line(w/2, 0, w/2, w);
    break;
  case 1:
    int v = floor(random(4));
    switch(v) {
    case 0:
      rect(0, 0, w/2, w/2);
      break;
    case 1:
      rect(0, w/2, w/2, w/2);
      break;
    case 2:
      rect(w/2, 0, w/2, w/2);
      break;
    case 3:
      rect(w/2, w/2, w/2, w/2);
      break;
    }
    break;
  case 2:
    int u = floor(random(4));
    switch(u) {
    case 0:
      arc(w/2, w/2, w, w, 0, HALF_PI);
      break;
    case 1:
      arc(w/2, w/2, w, w, HALF_PI, PI);
      break;
    case 2:
      arc(w/2, w/2, w, w, PI, PI+HALF_PI);
      break;
    case 3:
      arc(w/2, w/2, w, w, PI+HALF_PI, PI*2);
      break;
    }
    break;
  }
}

void keyPressed() {
  redraw();
}
