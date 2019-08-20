class Crazy extends Climon {

  Crazy (int x0, int y0, int il, int ir) {
    super(x0, y0, il, ir);
  }

  void move() {
    x = (x + int(random(12)-7)) % width;
    y = (y + int(random(12)-5)) % height;
    if (x < 0) {
      x = width;
    }

    if (y < 0) {
      y = height;
    }
  }
}
