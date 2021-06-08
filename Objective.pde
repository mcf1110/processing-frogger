public class Objective extends Block implements Collidable {
  private boolean collected;
  
  public Objective(int x){
    super(x, 1, #ffff00);
  }

  public void update(){}
  
  public boolean doCollision(Player p) {
    if(pos.x == p.pos.x && pos.y == p.pos.y && !collected){
       collected = true;
       p.collectObjective();
       return true;
    }
    return false;
  }
  
  public void show(){
    if(!collected){
      super.show();
    }
  }
}
