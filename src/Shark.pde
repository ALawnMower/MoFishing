// Alan Mo 1A

class Shark extends Fish {
  // instance variables
  float x, y, wi, hi, sWeight, xSpeed, ySpeed;
  color sc;
  boolean caught;
  String sType;

  // constructor
  Shark() {
    // random position
    x = random(0, width);
    y = random(height/1.5, height);

    //random shark size
    wi = random(90, 110);
    hi = random(40, 50);

    // random shark weight
    sWeight = wi + 70 + random(9.99);

    // random speed
    xSpeed = random(-1, 1);
    ySpeed = random(-0.5, 0.5);

    // random shark color
    sc = color(random(70, 150));

    caught = false;

    // random type
    sType = "Blacktip Shark";
    //type = str(int(random(5)));
    if (int(random(5)) == 0) {
      sType = "Bull Shark";
    }
    if (int(random(5)) == 1) {
      sType = "Tiger Shark";
    }
    if (int(random(5)) == 2) {
      sType = "Hammerhead Shark";
    }
    if (int(random(5)) == 3) {
      sType = "Great White Shark";
    }
    if (int(random(5)) == 4) {
      sType = "Blue Shark";
    }
  }// end of constructor

  void display() {
    stroke(200);
    strokeWeight(1);
    // display shark
    fill(sc);
    ellipse(x, y, wi, hi);
    fill(255);
    textAlign(LEFT);
    text(nf(sWeight, 0, 2), x - (wi/2)+4, y+7);

    if ((mouseX >= (x - (wi/2))) && (mouseX <= (x + (wi/2))) && (mouseY >= (y - (hi/2))) && (mouseY <= (y + (hi/2)))) {

      fill(0);
      textSize(60);
      textAlign(LEFT);
      //print(type);
      text(sType, width/2-480, height/3);

      if (mousePressed) {// if clicked
      }// end of if clicked
    }// end of if cursor is within button, change how button looks
  }// end of display method

  // movement method
  void move() {
    // shark collision detection

    if (dist(x, y, h.x, h.y) <= hi) {// if touching hook thengameOver

      s.gameOver = true;
    }

    x = x + xSpeed;
    if (x > width) {// off the right of the screen
      xSpeed = random(-1);
    } else if (x<0) {// off the left of the screen
      xSpeed = random(1);
    }

    y = y +ySpeed;
    if (y >= height) {// below the water
      ySpeed = random(-0.5);
    } else if (y<height/1.5) {// above the water
      ySpeed = random(0.5);
    }
    // end of shark collision detection
  }// end of move method
}// end of class
