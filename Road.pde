public class Road extends Lane {
  public Road(int speed, int blockSize, int spacing, int y){
    super(speed, blockSize, spacing, y, #000000);
  }
  
  public AutoMovingBlock make(int direction, int frames, int x, int y){
    return new Vehicle(direction, frames, x, y);
  }
}
