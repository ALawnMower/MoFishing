// Alan Mo 1A

class Score {
  // instance variables
  int level;
  float score/*, rScore*/;
  boolean start, gameOver;

  // constructor
  Score() {
    level = 1;
    score = 0;
    //rScore = level*50;
    start = true;
    gameOver = false;
  }// end of constructor

  // display method
  void display() {
    fill(0);
    strokeWeight(2);
    textSize(30);
    text("Level " + level, 25, 50);
    text("You Caught " + nf(score, 0, 2) + " Pounds of Fish", 25, 100);
    text("You Need " + nf(level*50 - score, 0, 2) + " More Pounds to Level Up!!!", 25, 150);
    if (score >= level*50) {// if required # of pounds is caught
      score = 0;
      level ++;
    }
  }// end of display method
}// end of class
