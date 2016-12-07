boolean blowUpFinished = false;
boolean explosionPlayed = false;
int blowUpWidth = 1;

void blowUp() {
    explode.play();
  noFill();
  strokeWeight(1);
  stroke(255);
  if(level<4) {
  ellipse(bulletX, bubbleY-threshold, blowUpWidth, blowUpWidth);
  ellipse(bulletX, bubbleY-threshold, (blowUpWidth/3)*2, (blowUpWidth/3)*2);
  ellipse(bulletX, bubbleY-threshold, blowUpWidth/3, blowUpWidth/3);
  }
  if(level==4) {
    ellipse(fish1X, fish1Y, blowUpWidth, blowUpWidth);
    ellipse(fish1X, fish1Y, (blowUpWidth/3)*2, (blowUpWidth/3)*2);
    ellipse(fish1X, fish1Y, blowUpWidth/3, blowUpWidth/3);
    for(int i = 0; i<bullets.length; i++) {
      if(bullets[i][0] != 0) {
        ellipse(bullets[i][0], bullets[i][1], blowUpWidth, blowUpWidth);
        ellipse(bullets[i][0], bullets[i][1], (blowUpWidth/3)*2, (blowUpWidth/3)*2);
        ellipse(bullets[i][0], bullets[i][1], blowUpWidth/3, blowUpWidth/3);
      }
    }
  }
  blowUpWidth+=3;
  if(blowUpWidth >= height) {
    blowUpFinished = true;
    explode.pause();
    explode.rewind();
  }
  
}
