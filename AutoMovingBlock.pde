public abstract class AutoMovingBlock extends Block implements Collidable {
  private int direction;
  private int frames;
  
  private int elapsedFrames = 0;
  
  public AutoMovingBlock(int direction, int frames, int x, int y, color c){
    super(x, y, c);
    this.direction = direction;
    this.frames = frames;
  }
  
  public void update() {
    elapsedFrames = (elapsedFrames + 1) % frames;
    if (elapsedFrames == 0) {
      this.move(direction);
    }
  }
}
