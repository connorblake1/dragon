int n = 13;
int el = 1;
boolean[] dragon = new boolean[350000];
void setup(){
  noLoop();
  background(0);
  size(1200,1200);
  colorMode(HSB);
  dragon[0] = true;
  println(dragon[0]);
  println();
}
  
void draw() {
  for (int i = 0; i< n; i++) {
    dragon = addArray(negateArray(flipArray(dragon,el),el),dragon,el);
    //dragon = negateArray(dragon,(2*el)+1);
    el = (2*el)+1;
    for (int j = 0; j < el; j++) {
      println(dragon[j]);}
    println();}
  display(dragon,el);
  save("dragon.png");
  }
  
boolean [] negateArray(boolean[] ta, int EL) {
  boolean[] TA = new boolean[ta.length];
  for (int i = 0; i < EL; i++) {
    TA[i] = !ta[i];}
  return TA;
  }
  
boolean [] flipArray(boolean[] ta, int EL) {
  boolean[] TA = new boolean[ta.length];
  for (int i = EL-1; i >= 0; i--) {
    TA[EL-1-i] = ta[i];}
  return TA;
  }

boolean[] addArray(boolean[] ta1, boolean[] ta2, int EL) {
  boolean[] TA = new boolean[(2*EL)+1];
  for (int i =0; i< TA.length; i++) {
    if (i < EL) {
      TA[i] = ta1[i];}
    else if (i == EL) {
      TA[i] = true;}
    else {
      TA[i] = ta2[i-EL-1];}}
  return TA;
}

void display(boolean[] ta,int EL) {
  background(0);
  stroke(255);
  strokeWeight(2);
  pushMatrix();
    translate(300,600);
    scale(0.25);
    rotate(PI/2);
    for (int i = 0; i < EL; i++) {
      stroke(int(i*255/EL),255,255);
      line(0,0,0,20);
      translate(0,20);
      if (ta[i]) {
        rotate(PI/2);}
      else {
        rotate(-PI/2);}}
  popMatrix();
}

boolean[] copyArray(boolean[] ta) {
  boolean[] TA = new boolean[ta.length];
  for (int i = 0; i<ta.length; i++) {
    TA[i] = ta[i];}
  return TA;
}
