int bricks_alive = 0; //<>//
PVector posball;
PVector spd;
boolean can_click = true;
PVector box;
PVector posbox;
float dif = 80;
int brick_number = 100;
int score = 0;
Brick [] br;

void setup() {
  size(1085, 700);
  posbox = new PVector(width/2-100, 650);
  spd = new PVector(0, 0);
  posball = new PVector(width/2, 640);
  box = new PVector(201, 25);
  br = new Brick [brick_number];
  bricks_alive = brick_number;
  for (int i=0; i<brick_number; i++) {
    br[i]= new Brick();
  }
}

void draw() {
  if (r_key && d_key) {
    can_click=true;
    brick_number =1;
    setup();
  }

  if (r_key) {
    can_click=true;
    brick_number +=1;
    setup();
  }
  background(0, 0, 0);
  stroke(0);
  line(0, 0, 1000000, 0);
  fill(255, 255, 255);
  ellipse(posball.x, posball.y, 20, 20);
  fill(255, 255, 255);
  rect(posbox.x, posbox.y, box.x, box.y);

  //Bricks
  for (int i =0; i<brick_number; i++) {
    br[i].draw();
  }    

  // paddle cant leave screen
  if ((posbox.x +200) > width) {
    posbox.x = width-200;
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
    String s = "Game Over!!";
    fill(255, 60, 255);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(s, width/2, height/2);
    fill(255, 255, 255);
  }

  if (bricks_alive == 0) {
    String s = "You Win!! Press R to Reset";
    fill(0, 255, 0);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(s, width/2, height/2);
    fill(255, 255, 255);
    spd.x = 0;
    spd.y = 0;
  }

  if (score == 0) {
    String s = "Welcome!!";
    fill(300, 200, 0);
    textAlign(CENTER, CENTER);
    textSize(80);
    text(s, width/2, height/2);
    fill(255, 255, 255);
  }
  fill(255, 255, 255);
  textAlign(CENTER, CENTER);
  textSize(30);
  text(score, 30, 10);
  fill(255, 255, 255);


  if (d_key && can_click) {
    posball.x += 10;
  }
  if (a_key && can_click) {
    posball.x -= 10;
  }

  if (d_key) {
    posbox.x +=10;
  } else if (a_key) {
    posbox.x -=10;
  }


  if (circ_box_collide(posball, 10, posbox, box)) {
    float q= posball.x-posbox.x;
    boolean w = true;
    if (q > 67 && q< 134 && w) {
      spd.y *=-1.01;
      w=false;
    }
    if (q > 0 && q< 67 && w) {
      spd.y *=-1.01;
      spd.x -= 5;
      w=false;
    }
    if (q > 134 && q< 201 && w) {
      spd.y *=-1.01;
      spd.x += 5;
      w=false;
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
