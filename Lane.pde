public abstract class Lane implements GameObject, Collidable {
  protected int direction, frames, blockSize, spacing, y;
  
  private ArrayList<AutoMovingBlock> blocks = new ArrayList();
  private int elapsedFrames = 0;
  private color bg;
  
  public Lane(int speed, int blockSize, int spacing, int y, color bg){
    this.direction = speed > 0 ? LEFT : RIGHT;
    this.frames = 300 / Math.abs(speed);
    this.blockSize = blockSize;
    this.spacing = spacing;
    this.y = y;
    this.bg = bg;
  }
  
  public abstract AutoMovingBlock make(int direction, int frames, int x, int y);
  
  public void show(){
    fill(bg);
    rect(0, y * Constants.GRID_SIZE, 512, Constants.GRID_SIZE);
    
    for(AutoMovingBlock b: blocks){
      b.show();
    }
  }
  
  public boolean doCollision(Player p){
    for(AutoMovingBlock b: blocks){
      if(b.doCollision(p)){
        return true;
      }
    }
    return false;
  }
  
  public void update(){
    spawnNewBlocks();
    
    for(AutoMovingBlock b: blocks){
      b.update();
    }
    removeBlocksOutsideOfView();
    elapsedFrames = (elapsedFrames + 1) % (frames * (blockSize + spacing)); 
  }
  
  private void spawnNewBlocks(){
    if(elapsedFrames % frames == 0){
      int sequenceIndex = elapsedFrames / frames;
      if(sequenceIndex < blockSize){
        blocks.add(
          make(direction, frames, direction == RIGHT ? 0 : 15, y)
        );
      }
    }
  }
  
  private void removeBlocksOutsideOfView(){
    if(blocks.size() > 0) {
      AutoMovingBlock first = blocks.get(0);
      if (first.pos.x < 0 || first.pos.x >= 16){
        blocks.remove(first);
      }
    }
  }
}
