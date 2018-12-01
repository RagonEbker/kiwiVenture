//RaGon Ebker
//Version 0.1.2 

PImage background; 
int sAcc = 2;   //movement speed
int jCount = 0; //Counting the seconds while jumping
int gCount = 10;  //Number of ground elements
int [] xA, yA, wA, hA;
  int cTramp = 0;
  boolean fTrue;
boolean forW;
boolean backW;
JSONObject jMap;


boolean onGround = false;
Ground [] ground;
Player player;
Trampolin trampolin;



void setup() {
  player = new Player(200, 200, 30, 30);
  jMap = loadJSONObject("/home/pi/sketchbook/creatingShapes/data/jMap.json");
  size(1366, 700, P2D);
  rectMode(CENTER);
  createGround();
  drawWorld();
  trampolin = new Trampolin(20,600,600,30,30);
  background = loadImage("test.jpg");
  
}

void draw() {
   background(#ADD8E6);
  if(player.getYP() <0) translate(0, 600);
  //translate(-player.getXP() +200, 0);
 
  onGround = true;
  pushStyle();
  fill(240, 200,0);
  noStroke();
  for (int i = 0; i<gCount; i++) {


    ground[i].display();
    checkGround(i);
  }
  popStyle();
  pushStyle();
  fill(50,153,50);
  playerAction();
  text( player.getYP(), 100, 0);
  popStyle();
  pushStyle();
  fill(0);

  popStyle();
  trampolin.display();
  checkTrampolin();
  
}

void keyPressed() {
  if (key == 'd') forW = true;
  if (key == 'a') backW = true;
  if (keyCode == ' ') player.setJTrue(true);
  if (key == 'r') {
    player.setXP(200);
    player.setYP(200);
    onGround = false;
  }
  if (key == 'p') onGround = true;
}

void keyReleased() {
  if (key == 'd') forW = false;
  if (key == 'a') backW = false;
}

void drawWorld() {
  for (int i =0; i<gCount; i++) {
    ground[i] = new Ground(xA[i], yA[i], wA[i], hA[i]);
  }
}
void createGround() {
  ground = new Ground[gCount];
  xA = new int[gCount];
  yA = new int[gCount];
  wA = new int[gCount];
  hA = new int[gCount];
  
  for(int i = 0; jMap.getString(i +"")!=null; i++){
    
    int[] nums = int(split(jMap.getString(Integer.toString(i)), ' '));
    xA[i] = nums[0];
    yA[i] = nums[1];
    wA[i] = nums[2];
    hA[i] = nums[3];
    
    
    printArray(yA);
    printArray(wA);
    printArray(hA);
  }
  printArray(xA);
  //xA[0] = 456;
  //yA[0]=  329;
  //wA[0] = 457;
 // hA[0] = 105; 
 /* xA[1] = 189;
  yA[1]=  177;
  wA[1] = 167;
  hA[1] = 20; */
}

void playerAction() {
  player.display();
  player.move();
  player.jump();
  player.grav();
}

void checkGround(int i) {
  int xPl = player.getXP()+player.getWP()/2 -1 ; //Hitbox of player x -coordinate to the left
  int xPr = player.getXP()-player.getWP()/2 +1; //Hitbox of x-coordinate to the right
  int yPa = player.getYP()+player.getHP()/2 -1;// Hitbox of player y -coordinate above
  int yPb = player.getYP()-player.getHP()/2 -1;// Hitbox of player y -coordinate above
  int xGl = (ground[i].getXR()-ground[i].getWR()/2);  //Hitbox of ground x-coordinate to the left
  int xGr = (ground[i].getXR()+ground[i].getWR()/2);  
  int yGa = (ground[i].getYR() - ground[i].getHR()/2); //Hitbox of ground y - coordinate
  int yGb = (ground[i].getYR() + ground[i].getHR()/2 - 1);
  boolean betweenY = yPa > yGa && yPa < yGb;
  boolean betweenX = xPr < xGr && xPl > xGl;
  //if ((yPa == yGa-1 || yPa == yGa) && xPl >= xGl && xPr <= xGr ) onGround = true; //ueberarbeiten?
  if (!betweenY && betweenX){
    
  onGround = false;}
  if (betweenY && betweenX) player.setYP(yGa-player.getHP()/2+2);
  if ( abs(yPb - yGb+1) <=3 && !onGround && (xPr <xGr) && (xPl >xGl))  player.setJTrue(false);
  text("" + onGround + yPa + ""+ (ground[1].getYR() - ground[1].getHR()/2 - 1), 100, 100);
  text(" " + (betweenY && betweenX) + "   " + (ground[0].getYR() - ground[0].getHR()/2 - 1) + " " + yPa, 100, 150);
}

void checkTrampolin() {
  if (frameCount >100){
  if (onGround)  fTrue =true;
  if (player.getXP() == trampolin.getTX() && player.getYP() >= trampolin.getTY()) {
     //checks if frameCount started counting
    if (fTrue) {
      cTramp = frameCount;
      fTrue =false;}
    //player.setYP(player.getYP()-200);
  }
  if (frameCount == cTramp) player.setJTrue(true);
  if (frameCount == cTramp+10) player.setJTrue(true);
  if (frameCount == cTramp+21) player.setJTrue(true);
  if (frameCount == cTramp+31) player.setJTrue(true);
  fill(0);
  text(cTramp, 100, 200);}
}
