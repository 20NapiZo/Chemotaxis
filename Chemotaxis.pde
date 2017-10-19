//Credit to Noah Anderson and Mr.Smith's starter code/slides
//Project by Zoe Napier
int chancesOfBecomingEvil = 0;
int bck = 0; //Background color changer
int o = 10000; //Changes the number of bacteria
Bacteria[] colony; //Declaration of the class

void setup() {
  background(bck);
  size (2000,1000); //Sets screen size
  colony = new Bacteria[o]; //Each thing in the array is a new bacteria
    for(int i=0; i<colony.length; i++) {
    colony[i] = new Bacteria();
  }
}

void draw(){
   for(int i=0; i<colony.length; i++){ //Each object does these actions
    colony[i].walk(); //moves
    colony[i].show(); //draws
  }
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == DOWN) { //DOWN key shows bacteria (no trails)
      background(bck);
      for(int i=0; i<colony.length; i++){
        colony[i].walk();
        colony[i].show();
      }
  } 
  if (keyCode == UP){ // UP key speeds up colony growth
    for(int i=0; i<colony.length; i++){
      colony[i].go();
    }
  }
   if (keyCode == SHIFT){ // SHIFT makes the bacteria grow faster than UP
    for(int i=0; i<colony.length; i++){
      colony[i].extream();
    }
  }
}
}

class Bacteria {
  int myX, myY; //Starting coordinates
  int s,r,g,b; //Bacteria Color Changers
  Bacteria(){
    myX = 1000; //Start x
    myY = 500; //Start y
    s = (int) (Math.random()*255); //Grayscale to a random number
    
    r = (int) (Math.random()*255); //Red value to a random number
    
    g = (int) (Math.random()*255); //Green value to a random number
    
    b = (int) (Math.random()*255); //Blue value to a random number
  }
  void walk(){ // Normal walk == moves one space in a random direction
    myX = myX + (int) (Math.random()*3)-1;
    myY = myY + (int) (Math.random()*3)-1;
  }
  void show(){ //Draws Bacteria/ Bacteria Trail
    noStroke();
   
      fill(s); //Change for differnt colors
    
    ellipse(myX,myY,.75,.75);
  }
  
  void go(){ //Fast walk == moves three spaces in a random direction
    myX = myX + (int) (Math.random()*7)-3;
    myY = myY + (int) (Math.random()*7)-3;
  }
  void extream(){ // Super walk == randomly moves 7 spaces in any direction
    myX = myX + (int) (Math.random()*15)-7;
    myY = myY + (int) (Math.random()*15)-7;
  }
}
