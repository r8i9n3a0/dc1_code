class Bonus {
  float x, y, num;
  int b = 0;
  Bonus (float x0, float y0) {
    x = x0 + width;
    num = y0;
  }

  void move() {
    x--;
    y = 50.0*cos(x/30.0)+num;
    if (y == num)
      num = random(height);
  }

  void display() {
    fill(255);
    ellipse(x, y, 30, 30);
    fill(0);
    textSize(10);
    text("+10", x, y+5);
  }

  void hit(int hx, int hy) {
    if (hy <= y+15 && hy >= y-15) {
      if (hx <= x+15 && hx >= x-15) {
        b++;
        time += 10;
      }
    }
  }

  boolean isDead() {
    if (b > 0) 
      return true;
    else 
      return false;
  }
}
