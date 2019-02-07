void appBackground() {
  background(255);
  fill(255);
  
  strokeWeight(2);
  rectMode(CORNERS);
  int[] numberButtonsBlock = getNumberButtonsBlockLocation();
  rect(numberButtonsBlock[0], numberButtonsBlock[1], numberButtonsBlock[2], numberButtonsBlock[3]);
  
  strokeWeight(2);
  int[] currentNumberBlock = getCurrentNumberBlockLocation();
  rect(currentNumberBlock[0], currentNumberBlock[1], currentNumberBlock[2], currentNumberBlock[3]);
  
  strokeWeight(4);
  int[] currentNumberTextBlock = getCurrentNumberTextBlockLocation();
  rect(currentNumberTextBlock[0], currentNumberTextBlock[1], currentNumberTextBlock[2], currentNumberTextBlock[3], 100);
  
  drawButtons();
  
  fill(#FF0000);
  textAlign(CENTER, CENTER);
  if (((getCurrentNumberTextBlockLocation()[2] - getCurrentNumberTextBlockLocation()[0])) < (getCurrentNumberTextBlockLocation()[3] - getCurrentNumberTextBlockLocation()[1])) {
    textSize(getCurrentNumberTextBlockLocation()[2] - getCurrentNumberTextBlockLocation()[0]);
  } else {
    textSize(getCurrentNumberTextBlockLocation()[3] - getCurrentNumberTextBlockLocation()[1]);
  }
  text(current.getNumber(), 
    getCurrentNumberTextBlockLocation()[0] + ((getCurrentNumberTextBlockLocation()[2] - getCurrentNumberTextBlockLocation()[0]) / 2), 
    getCurrentNumberTextBlockLocation()[1] + ((getCurrentNumberTextBlockLocation()[3] - getCurrentNumberTextBlockLocation()[1]) / 2));
  
  if (previousNumbers.size() > 1) {
    if (((getCurrentNumberTextBlockLocation()[2] - getCurrentNumberTextBlockLocation()[0])) < (getCurrentNumberTextBlockLocation()[3] - getCurrentNumberTextBlockLocation()[1])) {
      textSize((getCurrentNumberTextBlockLocation()[2] - getCurrentNumberTextBlockLocation()[0]) / 2);
    } else {
      textSize((getCurrentNumberTextBlockLocation()[3] - getCurrentNumberTextBlockLocation()[1]) / 2);
    }
    textAlign(CENTER, TOP);
    fill(0);
    text(previousNumbers.get(previousNumbers.size() - 2).getNumber(),
      getCurrentNumberTextBlockLocation()[0] + ((getCurrentNumberTextBlockLocation()[2] - getCurrentNumberTextBlockLocation()[0]) / 2),
      getCurrentNumberTextBlockLocation()[1] + ((getCurrentNumberTextBlockLocation()[3] - getCurrentNumberTextBlockLocation()[1])));
  }
}

void drawButtons() {
  for (Button b : buttons) {
    b.drawSelf();
  }
  resetButton[0].drawSelf();
}
