class Button {
  private int x1;
  private int x2;
  private int y1;
  private int y2;
  private int value;
  private color buttonColor;
  private color pressedButtonColor;
  private color valueColor;
  private boolean pressed;
  
  public Button(int x1, int y1, int x2, int y2, int value, color buttonColor, color pressedButtonColor, color valueColor) {
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
