class Game implements GameObject {
  Player player;
  ArrayList<GameObject> world = new ArrayList();
  
  public Game(){
    player = new Player();
    
    world.add(new River(-10, 2, 4, 3));
    world.add(new River(15, 3, 4, 4));
    world.add(new River(-17, 3, 8, 5));
    
    world.add(new Road(10, 2, 3, 9));
    world.add(new Road(-15, 3, 5, 10));
    world.add(new Road(20, 4, 8, 11));
        
    world.add(new Objective(1));
    world.add(new Objective(3));
    world.add(new Objective(5));
    world.add(new Objective(7));
    world.add(new Objective(9));
    world.add(new Objective(11));
    world.add(new Objective(13));
    
    world.add(player);
  }
  
  public void show(){
    for(GameObject g: world){
      g.show();
    }
  }
  
  public void update(){
    for(GameObject g: world){
      g.update();
      if(g instanceof Collidable){
        Collidable c = (Collidable) g;
        c.doCollision(player);
      }
    }
  }
  
  public void handleInput(int kCode){
    player.move(kCode);
  }
}
