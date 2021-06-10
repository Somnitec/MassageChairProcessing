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
  audioPlayer = minim.loadFile("speech1.mp3");
  //audioPlayer.loop();
  //audioPlayer.pause();
}

public void draw() {
  background(230);
  /*
  if(audioPlayer.isPlaying()){
   kneading.setSelected(true);
   
   } else kneading.setSelected(false);
   */
  if (programRunning.isSelected()) {
    if ( !audioPlayer.isPlaying())  audioPlayer.loop();

    if (!pounding.isSelected()) {
      pounding.setSelected(true);
      pounding_clicked(pounding, GEvent.CLICKED);
    }


    background((int)map(audioPlayer.left.level(), 0, voiceTriggerLevel.getValueF(), 0, 255));
    poundingSpeed.setValue(map(audioPlayer.left.level(), 0, voiceTriggerLevel.getValueF(), 0, 1));
    poundingSpeed_change(poundingSpeed, GEvent.CLICKED);
  } else {
    if ( audioPlayer.isPlaying() ) {
      audioPlayer.pause();
    }
  
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
}



void sendCommand(String input, int value) {

  myPort.write("{" + input + ":["+str(value)+ "]}");
}
