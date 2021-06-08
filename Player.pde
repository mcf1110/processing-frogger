class Player extends Block{
  
  private int score = 0;
  private int lives = 3;
  private boolean isDead = false;
  
  public Player(){
    super(8, 14, #00FF00);
  }
  
  public void update(){
  }
  
  public void collectObjective(){
    score++;
    pos.x = 8;
    pos.y = 14;
  }
  
  public void show() {
    super.show();
    fill(#111111, 120);
    rect(0, 512-64, 64, 64);
    fill(#FFFFFF);
    textSize(16);
    text("♥ " + lives, 16, 512-48); 
    text("★ " + score, 16, 512-16); 
    tint(255);
  }
  
  public void kill(){
    lives = Math.max(0, lives-1);
    if(lives > 0) {
      pos.x = 8;
      pos.y = 14;
    } else {
      isDead = true;
    }
  }
  
  public void move(int k){
    if(!isDead){
      super.move(k);
    }
  }

}
