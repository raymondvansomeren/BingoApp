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
