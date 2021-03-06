class Brick {
  PVector pos;
  PVector dim;
  boolean safe = false;
  PVector posvar[];
  int life;
  int _x;
  int _y;

  Brick() {
    _x = int(random(0, 31));
    _y = int(random(0, 24));
    posvar = new PVector[300];
    for (int i = 0; i <200; i++) {
      posvar[i] = new PVector(0, 0);
      posvar[i].x = 35*i;
    }
    for (int i = 0; i <100; i++) {
      posvar[i].y = 25*i;
    }
    pos = new PVector(posvar[_x].x, posvar[_y].y);
    dim = new PVector(35, 25);
    life = int(random(1, 5));
  }

  void draw() {    
    if (lost) {
      bricks_alive +=1;
      kill();
    }
    fill(500, 255, 255, 70 * life);
    rect(pos.x, pos.y, dim.x, dim.y);
    if (circ_box_reflect(posball, 10, pos, dim, spd)) {
      life--;
      score++;
      if (life==0) {
        kill();
      }
    }
  }

  void update() {
    kill();
  }


  void kill() {
    pos.set(-10000, 10000);
    bricks_alive -=1;
  }
  void _kill() {
    pos.set(-10000, 10000);
    bricks_alive = 0;
  }
}
