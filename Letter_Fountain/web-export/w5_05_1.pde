FallingLetter letters[]= {
};
PFont myFont;

void setup() {
  size(800, 500);
  background(255);
  smooth();
  myFont = loadFont("HelveticaNeue-UltraLight-200.vlw");
  textFont(myFont);
}

void draw() {

  if (keyPressed) {
    FallingLetter thisLetter;
    thisLetter=new FallingLetter(key);
    letters = (FallingLetter[])append(letters, thisLetter);
  }
  for (int i=0; i< letters.length; i++) {
    letters[i].moveLetter();
    letters[i].displayLetter();
  }
  println(letters.length);
}

void mouseClicked() {
  saveFrame((int)random(10000)+".pmg");
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
    y=height+5;
    sX=randomGaussian()*1.5;
    sY=-(10+randomGaussian()*2); //7
    aY=0.2;
    charSize=random(15, 60);
    alpha=255;
    if (random(100)>90) {
      col=color(250, 0, 0);
    } else {
      col=color(0, 0, 0);
    }
  }

  void moveLetter() {
    x=x+sX;
    y=y+sY;
    sY=sY+aY;
  }

  void displayLetter() {
    textSize(charSize);
    stroke(0, alpha);
    fill(col, 5);
    text(letter, x, y);
  }
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
    y=height+5;
    sX=randomGaussian()*1.5;
    sY=-(10+randomGaussian()*2); //7
    aY=0.2;
    charSize=random(15, 60);
    alpha=255;
    if (random(100)>90) {
      col=color(250, 0, 0);
    } else {
      col=color(0, 0, 0);
    }
  }

  void moveLetter() {
    x=x+sX;
    y=y+sY;
    sY=sY+aY;
  }

  void displayLetter() {
    textSize(charSize);
    stroke(0, alpha);
    fill(col, 5);
    text(letter, x, y);
  }
}


