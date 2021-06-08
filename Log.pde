public class Log extends AutoMovingBlock {
  
  Player attached = null;
  
  public Log(int direction, int frames, int x, int y) {
    super(direction, frames, x, y, #800000);
  }
  
  
  public boolean doCollision(Player p){
    if(checkCollision(p)) {
      attached = p;
      return true;
    }
    attached = null;
    return false;
  }
  
  public void move(int k){
    super.move(k);
    if(attached != null){
      attached.move(k);
    }
  }
}
