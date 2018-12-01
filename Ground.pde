class Ground {
  int xR;  //x -cord of rectangle
  int yR;  //y- cord of rectangle
  int wR;  //width of rectangle
  int hR;  //height of rectangle
  int rR; //Radius of corner of rectangle
  int yG = (yR-hR/2);
 
  boolean isBool;
  Ground (int xR, int yR, int wR, int hR) {
    this.xR = xR;
    this.yR = yR;
    this.wR = wR;
    this.hR = hR;
  }

  void display() {
    rect(xR, yR, wR, hR);
    //println(hR);
    //println(ground[0].getHR()/2);
    //println(yG);
    //println(yR-hR/2);
  }

  int getXR() {
    return xR;
  }

  int getYR() {
    return yR;
  }

  int getHR() {
    return hR;
  }

  int getWR() {
    return wR;
  }

  void setXR(int xR) {
    this.xR = xR;
  }

  void setYR(int yR) {
    this.yR = yR;
  }

  void setHR(int hR) {
    this.hR = hR;
  }

  void setWR(int wR) {
    this.wR = wR;
  }

  /** void checkGround() {
   if (((xR-wR/2 ) <= getX() && (xR+wR/2) >= getX()) && (((yR - hR/2) == (getY()+14))) ) onGround = true;
   else onGround = false;
   }**/

}
