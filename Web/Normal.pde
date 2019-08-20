class Normal extends Climon {

  Normal (int x0, int y0, int il, int ir) {
    super(x0, y0, il, ir);
  }

  void move() {
    x = (x + speed) % width;
    y = (y + speed) % height;
  }
}
