PVector posball; //<>//
PVector spd;
boolean can_click = true;
PVector box;
PVector posbox;
float dif = 110;
int brick_number = 100;
int score = 0;
Brick [] br;

void setup() {
  size(1080, 700);
  posbox = new PVector(height/2, 650);
  spd = new PVector(0, 0);
  posball = new PVector(height/2, 645);
  box = new PVector(200, 25);
  br = new Brick [brick_number];
  for (int i=0; i<brick_number; i++) {
    br[i]= new Brick();
  }
}

void draw() {
  if (r_key) {
    setup();
  }
  background(0, 0, 0);
  stroke(0);
  line(0, 0, 1000000, 0);
  fill(255,255,255);
  ellipse(posball.x, posball.y, 20, 20);
  fill(255, 255, 255);
  rect(posbox.x, posbox.y, box.x, box.y);

  //Bricks
  for (int i =0; i<brick_number; i++) {
    br[i].draw();
  }    

  // paddle cant leave screen
  if ((posbox.x +100) > width) {
    posbox.x = width-100;
  }
  if (posbox.x < 0) {
    posbox.x = 0;
  }



  fill(255, 255, 255);
  posball.x = posball.x + spd.x;
  posball.y = posball.y + spd.y;
  if (posball.x >= width) {
    spd.x *= -1;
  }
  if (posball.y <= 0) {
    spd.y *= -1;
  }
  if (posball.x <= 0) {
    spd.x *= -1;
  }
  if (posball.y >= height) {
    String s = "GaMe OvEr!!";
    fill(255, 60, 255);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(s, width/2, height/2);
    fill(255, 255, 255);
  }
  int bricks_alive = 0;
  for(Brick b : br) {
    if(b.life > 0) {
      bricks_alive++;
       
    }
  }
  if(bricks_alive <= 0) {
  String s = "YoU WiN!!";
    fill(0, 255, 0);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(s, width/2, height/2);
    fill(255, 255, 255);   
  }
  
  if(bricks_alive >= 100) {
  String s = "WeLcOmE!!";
    fill(300, 200, 0);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(s, width/2, height/2);
    fill(255, 255, 255);   
  }

  fill(255, 255, 255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text(score, 10, 10);
  fill(255, 255, 255);

  if (d_key) {
    posbox.x +=10;
  } else if (a_key) {
    posbox.x -=10;
  }


  if (circ_box_collide(posball, 5, posbox, box)) {
    float q= posball.x-posbox.x;
    boolean w = true;
    if (q > 100 && q< 200 && w) {
      spd.y *=-1;
      w=false;
    }
    if (q > 0 && q< 100 && w) {
      spd.y *=-1;
      spd.x -= 5;
      w=false;
    }
    if (q > 200 && q< 300 && w) {
      spd.y *=-1;
      spd.x +=5 ;
      w=false;
      spd.y *=-1;
    }
    w=true;
  }
}

void mousePressed() {
  if (can_click)
  {
    spd.x = (mouseX - posball.x)/dif;
    spd.y = (mouseY- posball.y)/dif;
    can_click = false;
  }
}




void keyPressed() {
  // Register other key presses (see Multi_keys)
  if (key == CODED)
    setCodedKey(keyCode, true);
  else
    setKey(key, true);
}

void keyReleased() {
  // Register key releases (see Multi_keys)
  if (key == CODED)
    setCodedKey(keyCode, false);
  else
    setKey(key, false);
} 
