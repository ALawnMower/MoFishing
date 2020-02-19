// Alan Mo 1A

class Fish {
  // instance variables
  float x, y, wi, hi, fWeight, xSpeed, ySpeed;
  color c;
  boolean caught;
  String fType, info;

  // constructor
  Fish() {
    // random position
    x = random(0, width);
    y = random(height/1.5, height);

    // random fish size
    wi = random(30, 50);
    hi = random(10, 30);

    // random fish weight
    fWeight = wi / random(7, 11) + random(0.99);

    // random speed
    xSpeed = random(-1, 1);
    ySpeed = random(-0.5, 0.5);

    // random fish color
    c = color(random(255), random(255), random(255));

    caught = false;

    // random type
    fType = "Halibut";
    info = "Halibut are the largest flat fish in the flounder family, females can grow to 500 pounds or more! When they are born, there is an eye on each side of the body and they swim just like all other fish, but after about 6 months of growing, one eye migrates to the other side of the body and they become a flat fish.";
    //type = str(int(random(5)));
    if (int(random(10)) == 0) {
      fType = "Salmon";
      info = "Salmon are anadromous, which means they are born in fresh water, go to saltwater in adulthood, and go back to the freshwater to spawn. They swim up-stream back to where they were born for spawning. Spawning is usually the last thing they do before they die because the spawning process takes so much energy.";
    }
    if (int(random(10)) == 1) {
      fType = "Tang";
    }
    if (int(random(10)) == 2) {
      fType = "Tuna";
    }
    if (int(random(10)) == 3) {
      fType = "Great White Shark";
    }
    if (int(random(10)) == 4) {
      fType = "Grouper";
    }
    if (int(random(10)) == 5) {
      fType = "Swordfish";
    }
    if (int(random(10)) == 6) {
      fType = "Triggerfish";
    }
    if (int(random(10)) == 7) {
      fType = "Angelfish";
    }
    if (int(random(10)) == 8) {
      fType = "Snapper";
    }
    if (int(random(10)) == 9) {
      fType = "Sunfish";
    }
  }// end of constructor

  void display() {
    stroke(200);
    strokeWeight(1);
    //display fish
    fill(c);
    ellipse(x, y, wi, hi);
    triangle(x+(x/2), y, x+10, y-10, x+10, y+10);
    fill(255);
    text(nf(fWeight, 0, 2), x - (wi/2)+4, y+7);

    if ((mouseX >= (x - (wi/2))) && (mouseX <= (x + (wi/2))) && (mouseY >= (y - (hi/2))) && (mouseY <= (y + (hi/2)))) {

      fill(0);
      textSize(60);
      textAlign(LEFT);
      //print(type);
      text(fType, width/2-480, height/3);
      textSize(30);
      //text("(Click to see more info)", width/2-480, height/3+50);
      text(info, width/2-480, height/3+100);


      if (mousePressed) {// if clicked
        text(info, width/2-480, height/3+100);
      }

      // stays on hook position if caught
      if (x + wi == h.x && y + hi == h.y) {
        x = h.x;
        y = h.y;
        print("caught fish");
      }
    }
  }// end of display method

  // movement method
  void move() {

    // fish collision detection
    if (dist(x, y, h.x, h.y) <= hi) {// if touching hook then move to hook position
      x = h.x;
      y = h.y;
      if (dist(x, y, p.x, p.y) <= 61) {// add fish points if brought fish up to the platform
        //myFish.remove();
        //x = random(0, width);
        //y = random(height/1.5, height);
        caught = true;
        s.score += fWeight;
      }
    }

    x = x + xSpeed;
    if (x > width) {// off the right of the screen
      xSpeed = random(-1.5);
    } else if (x<0) {// off the left of the screen
      xSpeed = random(1.5);
    }

    y = y +ySpeed;
    if (y >= height) {// below the water
      ySpeed = random(-0.1);
    } else if (y<height/1.5) {// above the water
      ySpeed = random(0.1);
    }
    // end of fish collision detection
  }// end of move method
  boolean isCaught() {
    if (caught) {
      return true;
    } else {
      return false;
    }
  }// end of isCaught
}// end of class
