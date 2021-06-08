public class River extends Lane {
  public River(int speed, int blockSize, int spacing, int y){
    super(speed, blockSize, spacing, y, #0000FF);
  }
  
  public AutoMovingBlock make(int direction, int frames, int x, int y){
    return new Log(direction, frames, x, y);
  }
  
  public boolean doCollision(Player p){
    boolean isInLane = p.pos.y == y;
    boolean isInLog = super.doCollision(p);
    if(!isInLane){
      return false;
    }
    if(!isInLog){
      p.kill();
    }
    return true;
  }
}
