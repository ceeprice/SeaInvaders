void youreDead() {
    failed.play();
  textAlign(CENTER, CENTER);
  textFont(waterlily, 100);
  fill(255);
  text("You're Dead!!", width/2, height/2-100);
  textFont(waterlily, 50);
  text("sorry about that :(", width/2, height/2 + 10);
  deadJelly.resize(250, 250);
  imageMode(CENTER);
  image(deadJelly, width/2, height/2 + 200);
    
}
