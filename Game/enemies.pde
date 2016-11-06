int enemyNumber = 8;
int spacing = 80;

int startPosition = 120;
int farLeftJelly = 120;
int farRightJelly;
int jellySize = 30;
int threshold  = jellySize/2+4;
int spaceAboveShip = 150;
int bottomRow = 200;

boolean [][] jellies = new boolean [enemyNumber][6];
PImage [][] enemies = new PImage [enemyNumber][6];

void loadEnemies() {
  for (int i = 0; i<enemyNumber; i++) {
    for (int m = 0; m<jellies[i].length; m++) {
      jellies[i][m] = true;
    }
  }
}

void enemies() {

  for (int k = 0; k<jellies.length; k++) {
    for (int j = 0; j<rowsPresent; j++) {
      if (jellies[k][j] != false) {
        enemies[k][j].resize(jellySize, jellySize);
        imageMode(CENTER);
        image(enemies[k][j], farLeftJelly + k*spacing, bottomRow - spacing*j);
        if (bottomRow >= height-spaceAboveShip) {
          currentLives = 0;
        }
      }
      if (k == jellies.length) {
        farRightJelly = farLeftJelly + k*spacing;
      }
    }
  }
  for (int k = 0; k<jellies.length; k++) {
    for (int j = 0; j<rowsPresent; j++) {
      if (bubbleY <= bottomRow+threshold - spacing*j && bubbleY > bottomRow-threshold - spacing*j) {
        if (bulletX < farLeftJelly + k*spacing + threshold && bulletX > farLeftJelly + k*spacing - threshold) {
          if (jellies[k][j] != false) {
            jellies[k][j] = false;
            bulletFired = false;
            currentScore ++;
            if (currentScore != previousScore + enemyNumber * rowsPresent ) {
              bubbleY = height-50;
            }
          }
        }
      }
    }
  }
}