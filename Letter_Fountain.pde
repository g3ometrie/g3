/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/211258*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
FallingLetter letters[]= {};
PFont myFont;

void setup() {
  size(500, 700);
  
  smooth();
  myFont = loadFont("HelveticaNeue-UltraLight-200.vlw");
  textFont(myFont);
}

void draw() {
 
  background(255,255,255);

  if (keyPressed) {
    FallingLetter thisLetter;
    thisLetter=new FallingLetter(key);
    letters = (FallingLetter[])append(letters, thisLetter);
  }
  for (int i=0; i< letters.length; i++) {
    letters[i].moveLetter();
    letters[i].displayLetter();
  }
}

void mouseClicked() {
  saveFrame((int)random(10000)+".png");
}

class FallingLetter {
  float x;
  float y;
  float sX;
  float sY;
  float aY;
  float rY;
  float charSize;
  char letter;
  float alpha;
  color col;

  FallingLetter(char _letter) {
    letter = _letter;
    x=width/2;
    y=height;
    sX=randomGaussian()*-1.2;
    sY=-(10+randomGaussian()*2);
    aY=0.2;
    charSize=random(5, 50);
    alpha=255;
    col=color(0);
  }

  void moveLetter() {
    float rY;
    x=x+sX;
    y=y+sY;
    sY=sY+aY;
    rY=-sY*1.6;
    if (y>height-5) {
      sY=sY+aY+rY;
      if (sY>-0.2) {
        sX=0;
        aY=0;
        sY=0;
        alpha=alpha-0.5;
      }
    }
  }


  void displayLetter() {
    textSize(charSize);
    stroke(0, alpha);
    fill(col, alpha);
    text(letter, x, y);
  }
}