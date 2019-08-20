class Fast extends Climon {

  Fast (int x0, int y0, int il, int ir) {
    super(x0, y0, il, ir);
  }

  void move() {
    x = x;
    y = (y + 20 + speed) % height;
  }
}
