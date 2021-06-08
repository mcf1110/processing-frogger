public class Vehicle extends AutoMovingBlock {
  
  public Vehicle(int direction, int frames, int x, int y) {
    super(direction, frames, x, y, #00FFFF);
  }
  
  
  public boolean doCollision(Player p){
    if(checkCollision(p)) {
      p.kill();
      return true;
    }
    return false;
  }
}
