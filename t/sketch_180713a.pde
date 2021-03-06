PVector pos;
PVector spd;
boolean can_click = true;
PVector box;
PVector posbox;
float dif;
Brick r;

void setup(){
  size(1800,960);
  
  posbox = new PVector(850,900);
  spd = new PVector(0,0);
  pos = new PVector(900,900);
  box = new PVector(100,6);
  dif = 100;
  r   = new Brick();
}

void draw(){
    background(0,0,255);
    ellipse(pos.x,pos.y,10,10);
    rect(posbox.x,posbox.y,100,6);
    
    //Bricks
    r.draw();
    
    
    fill(255,255,255);
    pos.x = pos.x + spd.x;
    pos.y = pos.y + spd.y;
    if (pos.x >= width){
      spd.x *= -1;
    }
    if (pos.y <= 0){
      spd.y *= -1;
    }
    if (pos.x <= 0){
      spd.x *= -1;
    }
    if (pos.y >= height){
      String s = "GAME OVER";
      fill(255,0,0);
      textAlign(CENTER,CENTER);
      textSize(80);
      text(s, width/2, height/2);
      fill(255,255,255);
}
  
    
    if (d_key){
      posbox.x +=10;
    }
    else if (a_key){
       posbox.x -=10;
    }
    
    
    if(circ_box_collide(pos,5,posbox,box)){
     spd.y *= -1;}


}

void mousePressed() {
  if(can_click)
 {
      spd.x = (mouseX - pos.x)/dif;
      spd.y = (mouseY- pos.y)/dif;
     // can_click = false;
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
