boolean startPageFinished = false;
boolean startPagePlaying = false;
int upperRow = 100;
int page = 0;
boolean fadeIn = true;
boolean fadeOut = false;
boolean subPlaying = true;
float opacity = 0;
int shipMover = 0;

int goLefters = width+50;
int goRighters = -50;

void fade() {
  if (fadeIn == true) {
      opacity++;
      if (opacity >= 255) {
        fadeOut = true;
        fadeIn = false;
      }
    }
    if (fadeOut == true) {
      opacity-=1;
      if (opacity <= 0) {
        fadeOut = false;
        fadeIn = true;
        page++;
      }
    }
  }


void startPage() {




  /*speakerOn.resize(20, 20);
  speakerOff.resize(20, 20);
  imageMode(CENTER);
  if (subPlaying == true) {
    yellowsub.play();
    image(speakerOn, 20, height-20);
  } else {
    yellowsub.pause();
    image(speakerOff, 20, height-20);
  }*/



  textFont(waterlily);
  textAlign(CENTER, CENTER);
  if (page != 3) {
    textSize(25);
    fill(255);
    text("Skip Intro", width-50, height-30);
  }
  
   fill(255, opacity);

  if (page == 0) {
    textSize(20);
    text("sort of", width/2, height/2-80);
    
    textSize(100);
    text("Proudly", width/2, height/2-50);
    text("Presenting", width/2, height/2+50);
    fade();
  }

  if (page == 1) {
    textSize(50);
    text("An InDe Studios", width/2, height/2-80);
    text("Production", width/2, height/2+80);
    textSize(80);
    text("2k16", width/2, height/2);
    fade();
  }

  if (page == 2) {
    textSize(80);
    text("Reasonably Unexciting", width/2, height/2-40);
    text("Christmas Holidays Inc.", width/2, height/2+40);
    textSize(25);
      text("In Collaboration with", width/2, height/2-100);
    text("and probably excessive coffee", width/2, height/2+120);
    fade();
  }


  if (page == 3) {
    textSize(100);
    text("Super Sea", width/2, height/2-100);
    text("Invaders", width/2, height/2);
    textSize(20);
    text("Press any key to start", width/2, height/2+120);

    for (int i = 1; i<enemies[0].length; i++) {
      enemies[0][i].resize(jellySize*3, jellySize*3);
      image(enemies[0][i], i*(spacing+40), upperRow);
    }
    ship.resize(200, 200);
    imageMode(CENTER);
    image(ship, shipMover, height-80);
    shipMover +=2;
    if (shipMover >= width+200) {
      shipMover = -200;
    }
    if (opacity < 255) {
      opacity++;
    }
    if (opacity == 200) {
      startPagePlaying = true;
    }
  }
}
