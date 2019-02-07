/**
 * Made with processing 3.4
 * Made for: Bingo de maatjes
 * Author: Raymond van Someren
 * Date: 6 Februari 2019
 */

Number current = new Number(0);
Number[] previousNumbers = new Number[90];
Number numberIndex = new Number(0);

Button[] buttons = new Button[90];
ResetButton[] resetButton = new ResetButton[1];

void setup() {
  fullScreen();
  
  for (int i = 0; i < 90; i++) {
    previousNumbers[i] = new Number(0);
  }
  
  int buttonsPerRow = 10;
  for (int i = 0; i < buttons.length / buttonsPerRow; i++) {
    for (int j = 0; j < buttonsPerRow; j++) {
      int x1 = getNumberButtonsBlockLocation()[2] / buttonsPerRow * j + getNumberButtonsBlockLocation()[0];
      int y1 = getNumberButtonsBlockLocation()[3] / (buttons.length / buttonsPerRow) * i + getNumberButtonsBlockLocation()[1];
      int x2 = (x1) + (getNumberButtonsBlockLocation()[2] / buttonsPerRow + getNumberButtonsBlockLocation()[0]) - 1;
      int y2 = (y1) + (getNumberButtonsBlockLocation()[3] / (buttons.length / buttonsPerRow) + getNumberButtonsBlockLocation()[1]) - 1;
      
      if (y1 < 0) {
        y1 = 0;
      } else if (y2 < 0) {
        y2 = 0;
      } else if (x1 < 0) {
        x1 = 0;
      } else if (x2 < 0) {
        x2 = 0;
      }
      buttons[i*buttonsPerRow+j] = new Button(x1, y1, x2, y2, i*buttonsPerRow+j + 1, 255, #00FF00, #0000FF);
    }
  }
  
  resetButton[0] = new ResetButton(getCurrentNumberBlockLocation()[0], getCurrentNumberBlockLocation()[1], getCurrentNumberBlockLocation()[2], getCurrentNumberBlockLocation()[1] + 100, "RESET", 255, 100);
  
  appBackground();
}

void draw() {
  appBackground();
}

void mousePressed() {
  for (Button b : buttons) {
    if (b.mouseOver()) {
      b.togglePressed();
      previousNumbers[numberIndex.getNumber()].setNumber(b.getValue());
      if (b.getPressed()) {
        numberIndex.add(1);
      } else {
        numberIndex.substract(1);
      }
      if (numberIndex.getNumber() <= 0) {
        current.setNumber(0);
      } else {
        current.setNumber(previousNumbers[numberIndex.getNumber() - 1].getNumber());
      }
    }
  }
  for (ResetButton rb : resetButton) {
    if (rb.mouseOver()) {
      current.setNumber(0);
      numberIndex.setNumber(0);
      
      for (Number n : previousNumbers) {
        n.setNumber(0);
      }
      
      for (Button b : buttons) {
        b.setPressed(false);
      }
    }
  }
}
