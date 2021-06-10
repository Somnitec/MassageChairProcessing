// Need G4P library
import g4p_controls.*;
// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.
import peasy.*;
import ddf.minim.*;
import processing.serial.*;


Serial myPort; 

Minim minim;
AudioPlayer audioPlayer;

public void setup() {
  
  size(480, 320, JAVA2D);
  myPort = new Serial(this, "COM5", 115200);
  createGUI();
  customGUI();
  // Place your setup code here
  minim = new Minim(this);
  audioPlayer = minim.loadFile("kneading.wav");
}

public void draw() {
  background(230);
  /*
  if(audioPlayer.isPlaying()){
    kneading.setSelected(true);
    
  } else kneading.setSelected(false);
  */
  if(programRunning.isSelected()){
    kneading.setSelected(true);
   
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
}

void knead() {
  

  audioPlayer.play();
  
}

void sendCommand(String input, int value) {

  myPort.write("{" + input + ":["+str(value)+ "]}");
}
