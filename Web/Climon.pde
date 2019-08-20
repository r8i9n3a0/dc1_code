abstract class Climon {
  int x, y, d = 1;
  int isLeftEarBroken;
  int isRightEarBroken;
  int leftD = 0, rightD = 0;
  int leftC = time - int(random(time-20));
  int rightC = time - int(random(time-20));
  color rc = color(0), lc = color(0);

  Climon (int x0, int y0, int il, int ir) {
    x = x0;
    y = y0;
    isLeftEarBroken = il;
    isRightEarBroken = ir;
  }

  void display() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    stroke(0);
    fill(255, 255, 255);
    ellipse(x+40, y+50, 80, 250);
    ellipse(x+160, y+50, 80, 250);
    
    
    if (isLeftEarBroken > 0) {
      if (leftC >= time && time >= leftC-5)
        lc = color(255, 0, 0);
      else
        lc = color(255, 200, 200);
      fill(lc);
      ellipse(x+50, y+30, 30, 100);
    }

    if (isRightEarBroken > 0) {
      if (rightC >= time && time >= rightC-5 )
        rc = color(255, 0, 0);
      else
        rc = color(255, 200, 200);
      fill(rc);
      ellipse(x+150, y+30, 30, 100);
    }
    
    fill(255, 255, 255);
    ellipse(x+100, y+150, 300, 180);

    fill(100, 100, 100);
    ellipse(x+50, y+150, 15, 20);
    ellipse(x+150, y+150, 15, 20);
    ellipse(x+100, y+170, 15, 10);


    stroke(100, 100, 100);
    strokeWeight(2);
    line(x+100, y+170, x+100, y+180);
    noFill();
    arc(x+85, y+180, 30, 20, 0, PI);
    arc(x+115, y+180, 30, 20, 0, PI);

    if (leftD > 0 && isLeftEarBroken >= 0) {
      leftD--;
      fill(255, 0, 0);
      if (d <= 0)
        text("-1", x-19, y-30 - (30 - leftD));
      else
        text("+1", x-19, y-30 - (30 - leftD));
    }
    if (rightD > 0 && isRightEarBroken >= 0) {
      rightD--;
      
      fill(255, 0, 0);
      if (d <= 0)
        text("-1", x+19, y-30 - (30 - rightD));
      else
        text("+1", x+19, y-30 - (30 - rightD));
    }
  }

  abstract void move();

  void hit(int hx, int hy) {
    if (hy <= y+80 && hy >= y-20) {
      if (hx <= x+65 && hx >= x+35) {
        if (lc == color(255, 200, 200)) {
          d = -1;
          isLeftEarBroken--;
        }
        else {
          d = +1;
          isLeftEarBroken++;
        }
        leftD = 30;
      }
    }

    if (hy <= x+80 && hy >= y-20) {
      if (hx <= x+165 && hx >= x+135) {
        if (rc == color(255, 200, 200)) {
          d = -1;
          isRightEarBroken--;
        }
        else {
          d = +1;
          isRightEarBroken++;
        }
        rightD = 30;
      }
    }
  }

  boolean isDead() {
    if (isRightEarBroken <= 0 && isLeftEarBroken <= 0) {
      return true;
    }
    else {
      return false;
    }
  }
}
