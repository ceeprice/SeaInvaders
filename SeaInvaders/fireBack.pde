int fireBackRate;
int fireBackTracker = 0;
float chosenJelly;
int chosenJellyRound;
float chosenJellyRow;
int jellyRow;
int rowsPresent;

boolean jellyChosen = false;
int fireBackX;
int fireBackY;
int fireBackSpeed = 5;


void fireBack() {
  if(level<4) {
  if (jellyChosen == false) {
    chosenJelly = random(0, enemyNumber-1);
    chosenJellyRow = random(1, rowsPresent);

    chosenJellyRound = round(chosenJelly);
    jellyRow = round(chosenJellyRow);
    jellyRow--;
    fireBackX = farLeftJelly + chosenJellyRound*spacing;
    fireBackY = bottomRow - spacing*jellyRow;
      if (jellies[chosenJellyRound][jellyRow] == true) {
      jellyChosen = true;
    }
    }
  if (jellyChosen == true) {
    noFill();
    stroke(255);
    strokeWeight(1);

    ellipse(fireBackX, fireBackY, 10, 10);
    fireBackY+=fireBackSpeed;

    if (fireBackY > height) {
      firedBack = false;
      jellyChosen = false;
    }
  }
}
}
