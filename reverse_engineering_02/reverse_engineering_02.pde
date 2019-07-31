color clib[] = { #FF6644, #BA00FF, #FF0046, #5DB9B6 };
float w = 20;
void setup() {
  size(600, 600);
  strokeWeight(2);
  stroke(255);
  noLoop();
}
void draw() {
  background(0);

  for (int i=0; i < 120; i++) {
    int I = round( random( 1.501, 22.499 ) );
    int J = round( random( 1.501, 22.499 ) );
    int s = round( random( -0.499, 5.499 ) );
    int C = round( random( -0.499, 2*clib.length ) );
    if ( C >= clib.length ) noFill();
    else fill( clib[ C ] );
    switch( s ) {
    case 0:// quadrado ortogonal
      {
        int L = round( random( 0.501, 3.499 ) );
        rect( t(I), t(J), L*w, L*w );
      }
      break;
    case 1:// quadrado diagonal
      {
        int R = round( random( 0.501, 3.499 ) );
        beginShape();
        vertex( t(I+R), t(J) );
        vertex( t(I+2*R), t(J+R) );
        vertex( t(I+R), t(J+2*R) );
        vertex( t( I ), t(J+R) );
        endShape(CLOSE);
      }
      break;
    case 2:// triangulo tl
      {
        int L = round( random( 0.501, 3.499 ) );
        beginShape();
        vertex( t(I), t(J) );
        vertex( t(I+L), t(J) );
        vertex( t(I), t(J+L) );
        endShape(CLOSE);
      }
      break;
    case 3:// triangulo tr
      {
        int L = round( random( 0.501, 3.499 ) );
        beginShape();
        vertex( t(I), t(J) );
        vertex( t(I+L), t(J) );
        vertex( t(I+L), t(J+L) );
        endShape(CLOSE);
      }
      break;
    case 4:// triangulo br
      {
        int L = round( random( 0.501, 3.499 ) );
        beginShape();
        vertex( t(I+L), t(J) );
        vertex( t(I+L), t(J+L) );
        vertex( t(I), t(J+L) );
        endShape(CLOSE);
      }
      break;
    case 5:// triangulo bl
      {
        int L = round( random( 0.501, 3.499 ) );
        beginShape();
        vertex( t(I), t(J) );
        vertex( t(I+L), t(J+L) );
        vertex( t(I), t(J+L) );
        endShape(CLOSE);
      }
      break;
    }
  }
  noStroke();
  fill(255);
  for (int i=0; i < 140; i++) {
    int I = round( random( 1.501, 22.499 ) );
    int J = round( random( 1.501, 22.499 ) );
    ellipse( t(I), t(J), 8, 8 );
  }
  stroke(255);

  //fill(100);
  //for (int i=0; i < 30; i++) {
  //  for (int j=0; j < 30; j++) {
  //    ellipse( (i+0.5) * w, (j+0.5) * w, 4, 4 );
  //  }
  //}
}
float t( float x ) {
  return (x+0.5) * w;
}
void keyPressed() {
  redraw();
}
