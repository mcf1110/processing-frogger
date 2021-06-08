abstract class Block implements GameObject {
  protected PVector pos; // [0, 0]
  protected color c;
  
  public Block(int x, int y, color c){
    this.pos = new PVector(x, y);
    this.c = c;
  }
  
  public void show(){
    int g = Constants.GRID_SIZE;
    fill(c);
    rect(pos.x * g, pos.y * g, g, g);
  }
  
  public void move(int k){
    switch(k){
      case UP: this.pos.y -= 1; break;
      case DOWN: this.pos.y += 1; break;
      case LEFT: this.pos.x -= 1; break;
      case RIGHT: this.pos.x += 1; break;
    }
  }
  
  public boolean checkCollision(Block b){
    return pos.x == b.pos.x && pos.y == b.pos.y;
  }
}
