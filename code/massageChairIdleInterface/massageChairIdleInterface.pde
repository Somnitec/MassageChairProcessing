import java.net.*;

// Need G4P library
import g4p_controls.*;
// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.
import peasy.*;
import ddf.minim.*;
import processing.serial.*;
import processing.sound.*;
SoundFile file;

import java.net.*;
import java.io.*;



String[] speech;


Serial chairArduino;
Serial controllerArduino; 

Minim minim;
AudioPlayer audioPlayer;

public void setup() {

  size(480, 320, JAVA2D);
  chairArduino = new Serial(this, "COM5", 115200);
  controllerArduino  = new Serial(this, "COM7", 115200);
  createGUI();
  customGUI();
  // Place your setup code here
  minim = new Minim(this);
  speech = loadStrings("speech.txt");
  googleTTS(speech[(int)random(speech.length)]);

  frameRate(10);
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
    if (!kneading.isSelected()) {
      kneading.setSelected(true);
      kneading_clicked(pounding, GEvent.CLICKED);
    }


    background((int)map(audioPlayer.left.level(), 0, voiceTriggerLevel.getValueF(), 0, 255));
    poundingSpeed.setValue(map(audioPlayer.left.level(), 0, voiceTriggerLevel.getValueF(), 0, 1));
    poundingSpeed_change(poundingSpeed, GEvent.CLICKED);
    kneadingSpeed.setValue(map(audioPlayer.left.level(), 0, voiceTriggerLevel.getValueF(), 0, 1));
    kneadingSpeed_change(kneadingSpeed, GEvent.CLICKED);
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

  chairArduino.write("{" + input + ":["+str(value)+ "]}");
}

void sendScreen(String text) {//does not work
  String input = "{\"controllerCommand\":\"test\",\"hello\":\"world\"}";
  chairArduino.write(input);
  println(input);
}

void googleTTS(String txt) {
  String u = "https://translate.google.com/translate_tts?ie=UTF-8&tl=";
  u = u + "en-GB" + "&client=tw-ob&q=" + txt;
  u = u.replace(" ", "+");
  try {
    URL url = new URL(u);
    try {
      URLConnection connection = url.openConnection();
      connection.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; .NET CLR 1.2.30703)");
      connection.connect();
      InputStream is = connection.getInputStream();
      File f = new File(sketchPath() + "/speech.mp3");
      OutputStream out = new FileOutputStream(f);
      byte buf[] = new byte[1024];
      int len;
      while ((len = is.read(buf)) > 0) {
        out.write(buf, 0, len);
      }
      out.close();
      is.close();
    } 
    catch (IOException e) {
      e.printStackTrace();
    }
  } 
  catch (MalformedURLException e) {
    e.printStackTrace();
  }
  audioPlayer = minim.loadFile("speech.mp3", 2048);

  audioPlayer.play();
  //s = "";
}
