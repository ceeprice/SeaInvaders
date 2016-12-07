import ddf.minim.*;

Minim minim;
AudioPlayer failed;
//AudioPlayer yellowsub;
AudioPlayer explode;
AudioSample bubble;
AudioPlayer win;

PImage bg;
PImage ship;
PImage jelly1;
PImage jelly2;
PImage star1;
PImage star2;
PImage fish1;
PImage fish2;
PImage octo1;
PImage octo2;
PImage blob1;
PImage blob2;
PImage deadJelly;
PImage heart;
PImage speakerOn;
PImage speakerOff;

PImage jellyVariation;
PImage starVariation;
PImage fishVariation;
PImage octoVariation;
PImage blobVariation;

PFont waterlily;

int currentSecond = 0;
int jellySpeed = 6;
int currentScore = 0;
int currentLives = 3;
int healthBar = currentLives*10;
int level = 0;
int fishHealthBar = 70;

boolean enemiesCalled = false;
boolean jellySwitcher = true;
boolean movedDown = false;
boolean firedBack = false;


void setup() {
  size(800, 800);
  smooth();
  bg = loadImage("background2.jpg");
  ship = loadImage("submarine.png");
  jelly1 = loadImage("jelly1-1.png");
  jelly2 = loadImage("jelly1-2.png");
  star1 = loadImage("star1.png");
  star2 = loadImage("star2.png");
  fish1 = loadImage("fish1.png");
  fish2 = loadImage("fish2.png");
  octo1 = loadImage("octo1.png");
  octo2 = loadImage("octo2.png");
  blob1 = loadImage("blob1.png");
  blob2 = loadImage("blob2.png");
  deadJelly = loadImage("deadjelly.png");
  heart = loadImage("heart.png");

  minim = new Minim(this);
  failed = minim.loadFile("failed.mp3");
  //yellowsub = minim.loadFile("Yellow Submarine.mp3");
  bubble = minim.loadSample("bubble.mp3");
  explode = minim.loadFile("explosion.mp3");
  win = minim.loadFile("youwin.mp3");
  
  //speakerOn = loadImage("speaker1.png");
  //speakerOff = loadImage("speaker2.png");

  jellyVariation = jelly1;

  waterlily = loadFont("Waterlily-Regular-100.vlw");
}

void draw() {
      if (currentSecond != second()) {
      if (level == 4 || level == 5) {
        if (bossdelaytrack < bossdelay) {
          bossdelaytrack++;
        }
      }
      currentSecond = second();
      if (jellySwitcher == true) {
        jellySwitcher = false;
        for(int i = 0; i<enemyNumber; i++) {
          enemies[i][0] = jelly1;
          enemies[i][1] = jelly1;
          enemies[i][2] = star1;
          enemies[i][3] = octo1;
          enemies[i][4] = fish1;
          enemies[i][5] = blob1;
          
          
        }
        blobVariation = blob1;
        fishVariation = fish1;
      } else {
        jellySwitcher = true;
        for(int i = 0; i<enemyNumber; i++) {
          enemies[i][0] = jelly2;
          enemies[i][1] = jelly2;
          enemies[i][2] = star2;
          enemies[i][3] = octo2;
          enemies[i][4] = fish2;
          enemies[i][5] = blob2;
        }
      }
      if(level>0) {
        fireBackTracker++;
        if (goingLeft == true) {
          goLeft();
        }
        if (goingRight == true) {
          goRight();
        }
        if (fireBackTracker == fireBackRate) {
        firedBack = true;
      }
        }
    }
    imageMode(CORNER);
    bg.resize(width, height);
    image(bg, 0, 0);
   if (startPageFinished == false) {
   startPage();
   }
   if (startPageFinished == true) {
  if (currentLives >= 1) {
    if (farLeftJelly <= threshold*2) {
      if (movedDown == false) {
        bottomRow +=jellySpeed*2;
        if (goingLeft == true) {
          goingLeft = false;
          goingRight = true;
          movedDown = true;
          goRight();
        } else {
          goingLeft = true;
          movedDown = true;
        }
      }
    }
    if (farLeftJelly > threshold*2 && farRightJelly < width-threshold*2) {
      movedDown = false;
    }
    if (farLeftJelly + (jellies.length-1)*spacing + threshold*2 > width) {
      if (movedDown == false) {
        bottomRow +=jellySpeed*2;
        goingLeft = true;
        goingRight = false;
        movedDown = true;
        goLeft();
      }
    }
    ship();
    if (bulletFired == true) {
      bullet();
    }
    
    if (level == 1) {
      level1();
    } 
    if (level == 2) {
      level2();
    }
    if (level == 3) { 
      level3();
    }
    if (level == 4 && blowUpFinished == false) { 
      boss1();
    }
    if(level == 4 && blowUpFinished == true) {
      win.play();
    textSize(100);
    textAlign(CENTER, CENTER);
    fill(255);
    text("You Win!!", width/2, height/2-40);
   
    textSize(60);
    text("Congratulations!", width/2, height/2+40);
    
    
    }

    fill(255);
    noStroke();
    textAlign(CENTER, CENTER);
    textFont(waterlily);
    textSize(20);
    text("Score: " + currentScore, width-50, 20); 
    text("Health", width-50, 60);
    text("Level: " + level, width-50, height-30);
    if(level >= 4) {
       text("Mobo", width-50, 120);
    }
    if (healthBar > currentLives*10) {
      healthBar --;
    }
    if (healthBar < currentLives*10) {
      healthBar++;
    }
    fill(13, 216, 0);
    strokeWeight(1);
    stroke(0);
    if (healthBar <=10) {
      fill(255, 0, 0);
    }
    rectMode(CENTER);
    rect(width-50, 90, healthBar, 10);
    
    if(level >=4 && fishHealth > 0) {
      fill(13, 216, 0);
      if(fishHealth < 20) {
        fill(255, 0, 0);
      }
      rectMode(CENTER);
      rect(width-50, 150, fishHealthBar, 10);
      if(fishHealthBar > fishHealth) {
        fishHealthBar--;
      }
    }

    if (enemiesCalled == false) {
        loadEnemies();
        enemiesCalled = true;
    }
    if (level < 4) {
      if (currentScore == previousScore + enemyNumber * rowsPresent) {
        if (blowUpFinished == false) {
          blowUp();
        }
        if (blowUpFinished == true) {
          levelUp();
        }
      }
    }



    if (firedBack == true) {
      fireBackTracker = 0;
      fireBack();
    }
    if (fireBackX + 5 <= shipX + 45 && fireBackX >= shipX - 45) {
      if (fireBackY >= height-75) {
        if (firedBack == true) {
          firedBack = false;
          jellyChosen = false;
          currentLives --;
        }
      }
    }
  } else {
    youreDead();
  }
}
}