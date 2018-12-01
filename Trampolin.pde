class Trampolin {
  int jumpheight;
  int tX;
  int tY;
  int tW;
  int tH;        //Basic data of trampolin, size, location and jumpheight
  
  
  Trampolin(int jumpheight, int tX, int tY, int tW, int tH){
    this.jumpheight = jumpheight;
    this.tX = tX;
    this.tY = tY;
    this.tW = tW;
    this.tH = tH;
  
  }
  
  void display(){
     rect(tX,tY,tW,tH);
  }
  int getTX() {
    return tX;
  }

  int getTY() {
    return tY;
  }

  int getTH() {
    return tH;
  }

  int getTW() {
    return tW;
  }

  void setTX(int tX) {
    this.tX= tX;
  }

  void setTY(int tY) {
    this.tY = tY;
  }

  void setTH(int tH) {
    this.tH = tH;
  }

  void setTW(int tW) {
    this.tW = tW;
  }

  

}
