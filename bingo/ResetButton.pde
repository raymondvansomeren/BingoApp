class ResetButton {
  private int x1;
  private int x2;
  private int y1;
  private int y2;
  private String buttonText;
  private color buttonColor;
  private color valueColor;
  
  public ResetButton(int x1, int y1, int x2, int y2, String buttonText, color buttonColor, color valueColor) {
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
