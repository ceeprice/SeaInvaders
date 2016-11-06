int previousScore = 0;
boolean bottomRowDeclared = false;

void setBottomRow() {
  if(bottomRowDeclared == false) {
  bottomRow = 100 + rowsPresent*50;
  bottomRowDeclared = true;
  }
}

void level1() {
fireBackRate = 4;
fireBackSpeed = 5;
  jellySpeed = 8;
  rowsPresent = 2;
  setBottomRow();
enemies();
}

void level2() {
  fireBackRate = 4;
  fireBackSpeed = 6;
  jellySpeed = 10;
  rowsPresent = 3;
  setBottomRow();
  enemies();
  
}

void level3() {
  fireBackRate = 2;
  fireBackSpeed = 6;
  jellySpeed = 12;
  rowsPresent = 4;
  setBottomRow();
  enemies();
}
