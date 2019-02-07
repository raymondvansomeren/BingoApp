int[] getNumberButtonsBlockLocation() {
  int[] rtrn = new int[4];
  rtrn[0] = 0;
  rtrn[1] = 0;
  rtrn[2] = width / 2;
  rtrn[3] = height;
  
  return rtrn;
}

int[] getCurrentNumberBlockLocation() {
  int[] rtrn = new int[4];
  rtrn[0] = width / 2;
  rtrn[1] = 0;
  rtrn[2] = width;
  rtrn[3] = height;
  
  return rtrn;
}

int[] getCurrentNumberTextBlockLocation() {
  int[] rtrn = new int[4];
  int[] temp = getCurrentNumberBlockLocation();
  
  rtrn[0] = (temp[0]) + (temp[0] / 10);
  rtrn[1] = height / 2 - height / 5;
  rtrn[2] = width - (temp[0] / 10);
  rtrn[3] = height / 2 + height / 5;
  
  return rtrn;
}

//int[] getLastNumberTextBlockLocation() {
//  int[] rtrn = new int[4];
//  int[] temp = getCurrentNumberBlockLocation();
  
//  rtrn[0] = 
//  rtrn[1] = 
//  rtrn[2] = 
//  rtrn[3] = 
  
//  return rtrn;
//}
