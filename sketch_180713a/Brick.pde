class Brick {
  PVector pos;
  PVector dim;
  boolean safe = false;

  int life;

  Brick() {
    pos = new PVector(random(width), random(height/1.2));
    dim = new PVector(35, 25);
    life = int(random(1, 5));
  }

  void draw() {    
    fill(500, 0, 0, 50 * life);
    rect(pos.x, pos.y, dim.x, dim.y);
    if (circ_box_reflect(posball, 5, pos, dim, spd)) {
      life--;
      score++;
      if (life==0) {
        kill();
      }
    }
  }

  void update() {
    if (life <= 0)
      kill();
  }

  void kill() {
    pos.set(-10000, 10000);
  }
}
