//todo
//vary breathing time


import java.net.*;

// Need G4P library
import g4p_controls.*;
// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.
import peasy.*;
import ddf.minim.*;
import processing.serial.*;

import java.net.*;
import java.io.*;



String[] speechString;


Serial chairArduino;
Serial controllerArduino; 

Minim minim;
AudioPlayer audioVoice;

AudioPlayer audioPounding;
AudioPlayer audioKneading;
AudioPlayer audioFeet;
AudioPlayer audioAirbags;
AudioPlayer audioBreath;
AudioPlayer audioChairFlat;
AudioPlayer audioRollerPos;
AudioPlayer audioRedGreen;





public void setup() {

  size(480, 320, JAVA2D);
  createGUI();
  customGUI();

  // Place your setup code here
  if (serialOn.isSelected()) {
    chairArduino = new Serial(this, "COM5", 115200);
    controllerArduino  = new Serial(this, "COM7", 115200);
  }
  minim = new Minim(this);
  speechString = loadStrings("speech.txt");
  audioVoice = minim.loadFile("speech.mp3", 2048);
  audioPounding = minim.loadFile("data/sounds/pounding.wav");
  audioKneading = minim.loadFile("data/sounds/kneading.wav");
  audioFeet = minim.loadFile("data/sounds/feetroller.wav");
  audioBreath= minim.loadFile("speech.mp3");
  audioChairFlat= minim.loadFile("speech.mp3");
  audioRedGreen = minim.loadFile("data/sounds/red/red"+(int)random(4)+".wav");

  audioVoice.setGain(10);

  audioPounding.setGain(-10);
  audioKneading.setGain(-20);
  audioFeet.setGain(-5);
  audioChairFlat.setGain(-40);
  audioBreath.setGain(-10);


  frameRate(60);
  voiceTriggerLevel.setValue(.10);
}



public void draw() {


  background(230);

  if (programRunning.isSelected()) runProgram();


  if (audioVoice.isPlaying()) {
    //background((int)map(audioVoice.left.level(), 0, voiceTriggerLevel.getValueF(), 0, 255));

    poundingSpeed.setValue(map(audioVoice.left.level(), 0, voiceTriggerLevel.getValueF(), 0, 1));
    poundingSpeed_change(poundingSpeed, GEvent.CLICKED);
    kneadingSpeed.setValue(map(audioVoice.left.level(), 0, voiceTriggerLevel.getValueF(), 0, 1));
    kneadingSpeed_change(kneadingSpeed, GEvent.CLICKED);
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
}



void sendCommand(String input, int value) {
  if (serialOn.isSelected())  chairArduino.write("{" + input + ":["+str(value)+ "]}");
}

void sendScreen(String text) {//does not work
  String input = "{\"controllerCommand\":\"test\",\"hello\":\"world\"}";
  chairArduino.write(input);
  println(input);
}

void speak() {
  audioVoice.close();
  audioVoice = minim.loadFile("data/sounds/chairVoice/chairvoice"+(int)random(16)+".wav");
  audioVoice.play();
}

void googleTTS(String txt) {
  println("speaking: "+txt);
  String u = "https://translate.google.com/translate_tts?ie=UTF-8&tl=";
  u = u + "en-US" + "&client=tw-ob&q=" + txt;
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
  audioVoice.close();
  audioVoice = minim.loadFile("speech.mp3", 2048);

  audioVoice.play();
  //s = "";
}

void resetAll() {
  poundingSpeed.setValue(1);
  poundingSpeed_change(poundingSpeed, GEvent.CLICKED);
  kneadingSpeed.setValue(1);
  kneadingSpeed_change(kneadingSpeed, GEvent.CLICKED);
  feetRollerSpeed.setValue(1);
  feetRollerSpeed_change(kneadingSpeed, GEvent.CLICKED);
  pounding.setSelected(false);
  pounding_clicked(pounding, GEvent.CLICKED);
  kneading.setSelected(false);
  kneading_clicked(pounding, GEvent.CLICKED);

  feetRoller.setSelected(false);
  feetRoller_clicked(feetRoller, GEvent.CLICKED);
  //airpump.setSelected(false);
  //airpump_clicked(airpump, GEvent.CLICKED);
  if (shoulders.isSelected()) {
    shoulders.setSelected(false);
    shoulders_clicked(shoulders, GEvent.CLICKED);
  }
  if (arms.isSelected()) {
    arms.setSelected(false);
    arms_clicked(arms, GEvent.CLICKED);
  }
  if (legs.isSelected()) {
    legs.setSelected(false);
    legs_clicked(legs, GEvent.CLICKED);
  }
  //outsideBellows.setSelected(false);
  //outsideBellows_clicked(outsideBellows, GEvent.CLICKED);
  if (redGreen.isSelected()) {
    redGreen.setSelected(false);
    redGreen_clicked(redGreen, GEvent.CLICKED);
  }
  if (chairFlat.isSelected()) {
    chairFlat.setSelected(false);
    chairFlat_clicked(chairFlat, GEvent.CLICKED);
  }

  audioPounding.unmute();
  audioKneading.unmute();
}

void bellowSound(boolean in) {
  /*
  if (in) {
   audioRedGreen = minim.loadFile("data/sounds/airbagsin/airbag"+(int)random(3)+".wav");
   audioRedGreen.play();
   } else {
   audioRedGreen = minim.loadFile("data/sounds/airbagsout/airbagout"+(int)random(3)+".wav");
   audioRedGreen.play();
   }
   */
}
