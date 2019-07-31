char lib[] ={ '⬔', '⬕', '⬔', '⬕', '◦', '⭕' };
color clib[] = { #FF6644, #FFFFFF, #FF0046, #5DB9B6 };
PFont font;
float w;
void setup() {
  size(600, 600);
  font = loadFont("Monospaced.plain-50.vlw");
  textFont( font );//textSize(50);
  textAlign( CENTER, CENTER );
  w = 0.9*textWidth( lib[0] );
  noLoop();
}

void draw() {
  translate( width, 0 );
  scale(-1, 1);
  background(0);
  for (int i=0; i < 15; i++) {
    for (int j=0; j < 15; j++) {
      fill( clib[round( random( -0.499, clib.length-0.501 ) ) ] );
      text( lib[ round( random( -0.499, lib.length-0.501 ) ) ], 10 + ((i+0.5) * w), 10 + ((j+0.5) * w) );
    }
  }
}

void keyPressed() {
  redraw();
}
