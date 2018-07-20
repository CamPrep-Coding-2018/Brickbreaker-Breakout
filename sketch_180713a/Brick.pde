class Brick{
   PVector pos;
   PVector dim;
   boolean safe = false;
   
   int life;
   
   Brick(){
     pos = new PVector(random(width/2), random(height/2));
     dim = new PVector(20,10);
     life = int(random(1,5));
   }
   
   void draw() {    
     fill(255, 0, 0, 50 * life);
     rect(pos.x, pos.y, dim.x, dim.y);
   }
   
   void update() {
     if (life <= 0)
       kill();
   }

void kill() {
     pos.set(-10000, 10000);
   }
    
boolean collide(PVector circle, float radius) {
     boolean collided = circ_box_collide(circle, radius, pos, dim);
     if (!safe && collided) {
       life--;
       safe = true;
     }
     if (safe && !collided) {
       safe = false;
     }
     if (life < 1){
      kill(); 
     }
     
     return collided;
   }
}
