class Player {

  int xP;       //x position of Player
  int yP;       //y position of Player
  int hP;       //Height of player
  int wP;       //Width of player
  int jumpH = 10; //jumping height
  int mSpeed = 3;  //Movement speed
  boolean jTrue;
  int gravity = 10;    //gravity constant
  

  Player(int xP, int yP, int wP, int hP) {
    this.xP = xP;
    this.yP = yP;
    this.wP = wP;
    this.hP = hP;
  }

  void display() {
    rect(xP, yP, hP, wP);
  }


  void jump() {

    if (jTrue) {
      yP -= jumpH;
      jCount++;
      //onGround = false;
    }
    if (jCount >=10) {
      jTrue = false;
      jCount = 0;
    }
  }

  void move() {
    if (forW) {
      xP +=sAcc;
    }
    if (backW) {
      xP -= sAcc;
    }
  }
  void grav() {
    if (!onGround) {
    
    yP += gravity;
    //if (frameCount % 32 == 0) gravity += 1;
  }
  if (onGround) gravity  = 2;
}



  int getXP() {
    return xP;
  }

  int getYP() {
    return yP;
  }
  
  int getWP() {
    return wP;
  }
  
  int getHP() {
    return hP;
  }
  
  void setXP(int xP){
    this.xP = xP;
  }
  
  void setYP(int yP){
    this.yP = yP;
  }
  
  void setWP(int wP){
    this.wP = wP;
  }
  
  void setHP(int hP){
    this.hP = hP;
  }
  
  void setJTrue(boolean jTrue){
    this.jTrue = jTrue;
  }
}
