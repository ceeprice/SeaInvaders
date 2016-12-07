

void keyPressed() {
  if(startPageFinished == false && startPagePlaying == true && keyCode != CONTROL) {
    startPageFinished = true;
        //yellowsub.close();
        level++;
  }
  if (keyCode == RIGHT && shipX < width-60) {
    shipX += 20;
  }
  if (keyCode == LEFT && shipX > 60) {
    shipX -= 20;
  }
  if (key == ' ' && bulletFired == false) {
    bubble.trigger();
    bulletFired = true;
    bulletX = shipX+2;
  }
}

void mousePressed() {
  if(startPageFinished == false) {
    if(mouseX > 700 && mouseY > 700) {
      page = 3;
    }
    if(mouseY > 750 && mouseX < 40) {
      subPlaying = ! subPlaying;
    }
  }
  
}