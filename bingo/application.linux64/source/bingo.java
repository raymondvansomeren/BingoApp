import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class bingo extends PApplet {

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

public void setup() {
  
  
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
      buttons[i*buttonsPerRow+j] = new Button(x1, y1, x2, y2, i*buttonsPerRow+j + 1, 255, 0xff00FF00, 0xff0000FF);
    }
  }
  
  resetButton[0] = new ResetButton(getCurrentNumberBlockLocation()[0], getCurrentNumberBlockLocation()[1], getCurrentNumberBlockLocation()[2], getCurrentNumberBlockLocation()[1] + 100, "RESET", 255, 100);
  
  appBackground();
}

public void draw() {
  appBackground();
}

public void mousePressed() {
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
class Button {
  private int x1;
  private int x2;
  private int y1;
  private int y2;
  private int value;
  private int buttonColor;
  private int pressedButtonColor;
  private int valueColor;
  private boolean pressed;
  
  public Button(int x1, int y1, int x2, int y2, int value, int buttonColor, int pressedButtonColor, int valueColor) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.value = value;
    this.buttonColor = buttonColor;
    this.pressedButtonColor = pressedButtonColor;
    this.valueColor = valueColor;
    this.pressed = false;
    drawSelf();
    //println("new button: " + toString());
  }
  
  public void drawSelf() {
    rectMode(CORNERS);
    if (pressed) {
      fill(pressedButtonColor);
    } else {
      fill(buttonColor);
    }
    rect(x1, y1, x2, y2);
    
    fill(valueColor);
    if ((x2 - x1) < (y2 - y1)) {
      textSize(x2 - x1 - 20);
    } else {
      textSize(y2 - y1 - 20);
    }
    textAlign(CENTER, CENTER);
    text(value, x1 + (x2 - x1) / 2, y1 + (y2 - y1) / 2);
  }
  
  public boolean mouseOver() {
    return mouseX >= x1 && mouseY >= y1 && mouseX <= x2 && mouseY <= y2;
  }
  
  public int getValue() {
    return value;
  }
  
  public boolean togglePressed() {
    pressed = !pressed;
    return pressed;
  }
  
  public boolean getPressed() {
    return pressed;
  }
  
  public void setPressed(boolean pressed) {
    this.pressed = pressed;
  }
  
  public String toString() {
    return "x1: " + x1 + " y1: " + y1 + " x2: " + x2 + " y2: " + y2 + " value: " + value;
  }
}
class Number {
  private int number;

  public Number(int value) {
    number = value;
  }

  public void setNumber(int value) {
    number = value;
  }

  public int getNumber() {
    return number;
  }
  
  public void substract(int value) {
    this.number -= value;
  }
  
  public void add(int value) {
    this.number += value;
  }
  
  public void multiply(int value) {
    this.number *= value;
  }
  
  public void divide(int value) { 
    this.number /= value;
  }
}
class ResetButton {
  private int x1;
  private int x2;
  private int y1;
  private int y2;
  private String buttonText;
  private int buttonColor;
  private int valueColor;
  
  public ResetButton(int x1, int y1, int x2, int y2, String buttonText, int buttonColor, int valueColor) {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    this.buttonText = buttonText;
    this.buttonColor = buttonColor;
    this.valueColor = valueColor;
    drawSelf();
    //println("new button: " + toString());
  }
  
  public void drawSelf() {
    rectMode(CORNERS);
    fill(buttonColor);
    rect(x1, y1, x2, y2);
    
    fill(valueColor);
    if ((x2 - x1) < (y2 - y1)) {
      textSize(x2 - x1 - 20);
    } else {
      textSize(y2 - y1 - 20);
    }
    textAlign(CENTER, CENTER);
    text(buttonText, x1 + (x2 - x1) / 2, y1 + (y2 - y1) / 2);
  }
  
  public boolean mouseOver() {
    return mouseX >= x1 && mouseY >= y1 && mouseX <= x2 && mouseY <= y2;
  }
  
  public String toString() {
    return "x1: " + x1 + " y1: " + y1 + " x2: " + x2 + " y2: " + y2 + " buttonText: " + buttonText;
  }
}
public void appBackground() {
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
  
  fill(0xffFF0000);
  textAlign(CENTER, CENTER);
  if (((getCurrentNumberTextBlockLocation()[2] - getCurrentNumberTextBlockLocation()[0])) < (getCurrentNumberTextBlockLocation()[3] - getCurrentNumberTextBlockLocation()[1])) {
    textSize(getCurrentNumberTextBlockLocation()[2] - getCurrentNumberTextBlockLocation()[0]);
  } else {
    textSize(getCurrentNumberTextBlockLocation()[3] - getCurrentNumberTextBlockLocation()[1]);
  }
  //textSize(150);  //TODO change to dynamic
  text(current.getNumber(), 
    getCurrentNumberTextBlockLocation()[0] + ((getCurrentNumberTextBlockLocation()[2] - getCurrentNumberTextBlockLocation()[0]) / 2), 
    getCurrentNumberTextBlockLocation()[1] + ((getCurrentNumberTextBlockLocation()[3] - getCurrentNumberTextBlockLocation()[1]) / 2));
}

public void drawButtons() {
  for (Button b : buttons) {
    b.drawSelf();
  }
  resetButton[0].drawSelf();
}
public int[] getNumberButtonsBlockLocation() {
  int[] rtrn = new int[4];
  rtrn[0] = 0;
  rtrn[1] = 0;
  rtrn[2] = width / 2;
  rtrn[3] = height;
  
  return rtrn;
}

public int[] getCurrentNumberBlockLocation() {
  int[] rtrn = new int[4];
  rtrn[0] = width / 2;
  rtrn[1] = 0;
  rtrn[2] = width;
  rtrn[3] = height;
  
  return rtrn;
}

public int[] getCurrentNumberTextBlockLocation() {
  int[] rtrn = new int[4];
  int[] temp = getCurrentNumberBlockLocation();
  
  rtrn[0] = (temp[0]) + (temp[0] / 10);
  rtrn[1] = height / 2 - height / 5;
  rtrn[2] = width - (temp[0] / 10);
  rtrn[3] = height / 2 + height / 5;
  
  return rtrn;
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "bingo" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
