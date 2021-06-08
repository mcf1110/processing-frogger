void setup(){
  size(512, 512);
  noStroke();
}

Game g = new Game();

void draw(){
  background(100);
  g.update();
  g.show();
}

void keyPressed(){
  g.handleInput(keyCode);
}
