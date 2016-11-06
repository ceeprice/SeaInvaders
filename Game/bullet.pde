int bubbleY = 750;
int bubbleSize = 15;
int bulletX;
boolean bulletFired = false;
int bulletSpeed = 5;

void bullet() {
  strokeWeight(2);
  stroke(220);
  noFill();
  ellipse(bulletX, bubbleY, bubbleSize, bubbleSize);
  arc(bulletX, bubbleY, bubbleSize-7, bubbleSize-7, PI, PI*1.5);
  bubbleY-=bulletSpeed;
  if(bubbleY <= 0) {
    bubbleY = height-50;
    bulletFired = false;
  }
  
}
