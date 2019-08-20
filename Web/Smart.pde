class Smart extends Climon {

  Smart (int x0, int y0, int il, int ir) {
    super(x0, y0, il, ir);
  }
  int m, n ;
  void move() {
    if ( (mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y) <= 100*100) { 
      if (0 <= x - mouseX) {
        m = speed + 1;
      }
      else {
        m = - speed - 1;
      }
      if (0 <= y - mouseY) {
        n = speed + 1;
      }
      else {
        n = -speed - 1;
      }
    }
    else {
      if (m < 0) m = -speed;
      else m = speed;

      if (n < 0) n = -speed;
      else n = speed;
    }
    if (x < 0) {
      x = width;
    }

    if (y < 0) {
      y = height;
    }
    x = (x + m) % width;
    y = (y + n) % height;
  }
}
