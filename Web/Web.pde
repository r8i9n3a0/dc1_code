Normal Climon1;
Smart Climon2;
Fast Climon3;
Crazy Climon4;
Bonus bonus1;
Bonus bonus2;

int s = 0, b = 0;
int speed;
int time = 30, seco, t = 31;
int r = 25;
int num = 400 / r;
int x;
int rect_size = 20;
int num1 = 600 / rect_size;
int stroke_w = 20;
int num2 = 600 / stroke_w;
int year, month, day, hour, minute;

void setup() {
  size(600, 400);
}

void draw() {
  size(600, 400);
  background(204, 255, 204);
  noStroke();
  
  fill(255, 255, 153);
  for (int i = 0 ; i < num;i++) {
    for (int j = 0; j < num+1;j++) {
      if (j % 2 == 0) {
        x = i * r * 2;
      }
      else {
        x = i * r * 2 + r;
      }
    
     ellipse(x, j*r, r, r);
   }
 }
 
  if (s == 0) {
    Startscreen();
    Climon1 = new Normal(100, 100, 2, 2);
    Climon2 = new Smart(200, 200, 1, 1);
    Climon3 = new Fast(300, 300, 3, 3);
    Climon4 = new Crazy(400, 200, 2, 2);
    bonus1 = new Bonus(random(width), random(80, height-80));
    bonus2 = new Bonus(random(width)+width*3, random(80, height-80));
    time = 30;
    t = 31;
  }
  else if (s == 1 && time >= 0) {
    int seco = second();
    if (seco != t) {
      t = seco;
      time--;
    }

    Climon1.move();
    Climon2.move();
    Climon3.move();
    Climon4.move();
    
    int monstercount = 4;
    
    bonus1.move();
    bonus2.move();
    if (Climon1.isDead() == false) {
      Climon1.display();
    }else{
      monstercount--;
    }
    if(Climon2.isDead() == false) {
      Climon2.display();
    }else{
      monstercount--;
    }
    if (Climon3.isDead() == false) {
      Climon3.display();
    }else{
      monstercount--;
    }
    if(Climon4.isDead() == false) {
      Climon4.display();
    }else{
      monstercount--;
    }
    
    if (bonus1.isDead() == false)
      bonus1.display();
    if (bonus2.isDead() == false)
      bonus2.display();
 
    textSize(20);
    text("CLICK MONSTERS", 300, 20);
    text(time +"s", 570, 20);
    text("Monster : " + monstercount,70,20);
    
  }
  else if (s == 2) {
    System.exit(0);
  }
  else if (s == 3) {
    HowToUse();
  }
  else if (s == 4) {
    levelselect();
  }

  if (Climon1.isDead() == true && Climon2.isDead() == true && Climon3.isDead() == true && Climon4.isDead() == true ) {
    showWinningMessage();
  }
  else if (time < 0) {
    GameOver();
  }
}


void mouseClicked() {
  if (Climon1.isDead() == false)
    Climon1.hit(mouseX, mouseY);
  if (Climon2.isDead() == false)
    Climon2.hit(mouseX, mouseY);
 
  if (Climon3.isDead() == false)
    Climon3.hit(mouseX, mouseY);
  if (Climon4.isDead() == false)
    Climon4.hit(mouseX, mouseY);
  if (bonus1.isDead() == false)
    bonus1.hit(mouseX, mouseY);
  if (bonus2.isDead() == false)
    bonus2.hit(mouseX, mouseY);
}

void Count() {
}
  
void showWinningMessage() {
  color[] c = new color[3];
  int color_count = 0;
  
  noStroke();
  strokeWeight(stroke_w);
  strokeCap(PROJECT);
  
  c[0] = color(255, 153, 204);
  c[1] = color(102, 204, 204);
  c[2] = color(255, 255, 153);
  
  for (int p = -num2 ; p <= num2; p++) {
    stroke(c[color_count % 3]);
    line(p * stroke_w, 0, p * stroke_w + width, height);
    color_count++;
  }

  fill(0);
  textAlign(CENTER);
  textSize(50);
  text("You won!", 300, 100);
  textSize(25);
  text("Sorry...,We were lying about special coupon...",300,160);
  text("That reality doesn't exist",300,180);
  textSize(18);
  text("Acquisition date: " + year() + "/" + month() + "/" + day() + " " + hour() + ":" + minute(), 300, 240);
 
  textSize(15);
  text("select  and  keystroke", 300, 290);
  textSize(20);
  text("R. Return Start screen", 300, 320);
  text("E. Game end", 300, 350);
  if ((keyPressed == true) && (key == 'r'))
    s = 0;
  else if ((keyPressed == true) && (key == 'e'))
    s = 2;
}

void Startscreen() {
  background(204, 255, 204);
  noStroke();
  
  fill(255, 255, 153);
  
  for (int i = 0 ; i < num; i++) {
    for (int j = 0; j < num+1; j++) {
      if (j % 2 == 0) {
        x = i * r * 2;
      }
      else {
        x = i * r * 2 + r;
      }
      
      ellipse(x, j*r, r, r);
    }
  }

  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("CLICK MONSTERS ~climon~", 300, 100);
  textSize(18);
  text("select  and  keystroke", 300, 130);
  textSize(20);
  text("1. Game Start", 300, 170);
  text("2. Game End", 300, 200);
  text("We'll give you special coupon,", 300, 240); 
  text("when you completed this game!!", 300, 270);
  text("⇒ 3. How To Play", 300, 310);
  
  
  if ((keyPressed == true) && (key == '1')) {
    s = 4;
  }
  else if ((keyPressed == true) && (key == '2')) {
    s = 2;
  }
  else if ((keyPressed == true) && (key == '3')) {
    s = 3;
  }
  
  
}

void GameOver() {
  background(0);
  fill(255, 0, 0);
  textAlign(CENTER);
  textSize(30);
  text("GAME OVER", 300, 150);
  textSize(20);
  text("Let's challenge this game again and again!!", 300, 180);
  textSize(20);
  text("R. Return Start screen", 300, 230);
  text("E. Game end", 300, 260);
  if ((keyPressed == true) && (key == 'r')) {
    s = 0;
  }
  else if ((keyPressed == true) && (key == 'e')) {
    s = 2;
  }
}

void HowToUse() {
  fill(0);
  textSize(20);
  text("Let's attack the monster's ears!!", 300, 40);
  text("You can attack by clicking on theirs ears.", 300, 70);
  text("You have to work hard because they move irregularly.", 300, 100);
  text("If you attack when the monster's ears are red, life increase.", 300, 130);
  text("So be careful.", 300, 160);
  text("R. Return Start screen", 300, 200);
  text("E. Game end", 300, 230);
  text("We'll give the free coupon for you!!",300, 280);
  text("Boba drink's size up coupon", 300, 310);
  textSize(15);
  text("or", 300, 330);
  textSize(20);
  text("50 yen coupon of beef bowl", 300, 350);
  if ((keyPressed == true) && (key == 'r'))
    s = 0;
  else if ((keyPressed == true) && (key == 'e'))
    s = 2;
}

void levelselect() {
  noStroke();
  for (int i = 0 ; i < num1; i++) {
    for (int j = 0; j < num1; j++) {
      if (j % 2 == 0) {
        if (i % 2 == 0) {
          fill(255, 153, 102);
        } 
        else {
          fill(255, 153, 255);
        }
      } 
    else {
      if (i % 2 == 0) {
        fill(255, 153, 255);
      } 
      else {
        fill(255, 153, 102);
      }
    }
    rect(i*rect_size, j*rect_size, rect_size, rect_size);
  }
}

  fill(0);
  textSize(25);
  text("Level select", 300, 120);
  textSize(20);
  text("select  and  keystroke", 300, 150);
  textSize(25);
  text("N. Normal level", 300, 220);
  text("H. Hard level", 300, 270);
  if ((keyPressed == true) && (key == 'n')) {
    speed = 2;
    s = 1;
  }
  else if ((keyPressed == true) && (key == 'h')) {
    speed = 8;
    s = 1;
  }
}
