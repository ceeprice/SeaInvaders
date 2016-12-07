PImage bossFish;
PImage bossFish2;
boolean boss1played = false;
int bossdelaytrack = 0;
int bossdelay = 4;
int fish1X = 200;
int fish1Y = -100;
int fishSpeed = 4;
boolean fishGoLeft = true;
boolean fishGoRight = false;
int bulletTimer = second();
float bossBulletX;
int bossBullet;
int[][] bullets = new int [15][2];
int fishHealth = 100;
int flasher = 0;

int b = 0;

void boss1() {
   if (bulletTimer != second()) {
        bulletTimer = second();
        if(fishHealth <= 0 && flasher<6) {
          flasher++;
        }
      }
  if (bossdelay == bossdelaytrack && blowUpFinished == false && flasher == 0 || flasher == 3 || flasher == 5) {
    bulletSpeed = 10;
    if (fish1Y < 100) {
      bossFish = fish1;
      fish1Y++;
      bossFish.resize(130, 130);
      imageMode(CENTER);
      image(bossFish, fish1X, fish1Y);
    }
    
    if (fish1Y == 100) {
      if(fishHealth>0) {
      if (fishGoLeft == true) {
        bossFish = fish1;
        fish1X+=fishSpeed;
      }
      if (fishGoRight == true) {
        bossFish = fish2;
        fish1X -= fishSpeed;
      }
      if (fish1X >= width-100) {
        fishGoLeft = false;
        fishGoRight = true;
      }
      if (fish1X <= 100) {
        fishGoLeft = true;
        fishGoRight = false;
      }
    }



      if (b<bullets.length) {
        if(fishHealth>0) {
        if (bullets[b][0] == 0 || bullets[b][1] > height) {
          bossBulletX = random(fish1X-200, fish1X+200);
          bossBullet = round(bossBulletX);
          bullets[b][0] = bossBullet;
          bullets[b][1] = fish1Y;
        }
        }
      }
      if(bullets[b][1]>=height/2.5 || bullets[b][0] == 0) {
        b++;
        if (b == bullets.length) {
          b=0;
        }
      }
      
      imageMode(CENTER);
      blob1.resize(jellySize*2, jellySize*2);
      heart.resize(jellySize, jellySize);

      bossFish.resize(130, 130);
      imageMode(CENTER);
      image(bossFish, fish1X, fish1Y);
      
      if(bubbleY < 100 && bulletX < fish1X + 50 && bulletX > fish1X - 50) {
        fishHealth -=7;
        currentScore++;
        bulletFired = false;
        bubbleY = height-50;
      }

      for (int d = 0; d<bullets.length; d++) {
        if (bullets[d][0] != 0) {
          if(bullets[d][1]>height+20) {
            bullets[d][0]= 0;
          }
          if(fishHealth>0) {
          bullets[d][1] +=8;
          }
          if (d<bullets.length-1 && bullets[d][0] !=0) {
            image(blob1, bullets[d][0], bullets[d][1]);
          }
          if (d == bullets.length-1 && bullets[d][0] !=0) {
            image(heart, bullets[d][0], bullets[d][1]);
          }
          if (bullets[d][1] >= height-75 && bullets[d][1] < height && bullets[d][0] >= shipX-45 && bullets[d][0]<= shipX + 45) {
          bullets[d][1] = fish1Y;
          bullets[d][0] = 0;
          if (d < bullets.length-1) {
            currentLives --;
          }
          if (d == bullets.length-1) {
            if(currentLives<7) {
            currentLives++;
            }
          }
        }
        }
        if(bubbleY <= bullets[d][1] && bulletX < bullets[d][0] + threshold+5 && bulletX > bullets[d][0] - threshold - 5) {
            bullets[d][0] = 0;
            bulletFired = false;
            bubbleY = 750;
          }

      }
      
      
      
      
    }
}
if(flasher == 6) {
  if(blowUpFinished == false) {
  blowUp();
  }
}

}
