class Brick{
   PVector pos;
   PVector dim;
   
   int life;
   
   Brick(){
     pos = new PVector(random(width), random(height));
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
}
