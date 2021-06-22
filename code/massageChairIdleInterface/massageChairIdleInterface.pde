//todo
//make breathing contant (but slowing/speeding?)
//write texts for speech
//make massage program make some sense
//record delicate sounds
//edit and tweak sounds for on sound shower (left/right separate, no distortion, right volume)
//confirm sounds not getting boring
//better speech engine?


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


  frameRate(10);
}

boolean caseRunning = false;
int currentCase =0;
int caseStartTime;
int cycles=0;
int cycleTime;

boolean breathIn = false;
int breathTimer = 0;

public void draw() {
  background(230);

  if (programRunning.isSelected()) {
    int bpm = 12;
    float breathInFraction = map(bpm, 5, 40, .2, .5);
    int breathTime = 60000 / bpm;
    if (breathIn)breathTime*=breathInFraction;
    else breathTime*=(1-breathInFraction);

    int timeNow=millis();
    if (timeNow-breathTimer>breathTime) {
      breathTimer=timeNow;
      breathIn=!breathIn;
      if (breathIn) {
        println("breath in");
        airpump.setSelected(true);
        airpump_clicked(pounding, GEvent.CLICKED);
        outsideBellows.setSelected(true);
        outsideBellows_clicked(outsideBellows, GEvent.CLICKED);
      } else {
        println("breath out");
        airpump.setSelected(false);
        airpump_clicked(pounding, GEvent.CLICKED);
        outsideBellows.setSelected(false);
        outsideBellows_clicked(outsideBellows, GEvent.CLICKED);
      }
    }


    //breathing code
    //40s until breating continues slow after talking

    //normal breathing 12 to 15breaths per minute
    //1.5-2s in
    //1.5-2s out
    //1-2s pauze

    //5bpm is slow breathing
    //exersize is 30-40bpm


    if (!caseRunning) {
      resetAll();
      int cases = 3;
      currentCase =  (int)random(cases);
      println("new case = "+currentCase);
      caseRunning=true;
      caseStartTime = millis();
    } else {
      switch (currentCase) {
      case 0://chilling
        if (cycles<0)cycles =4;
        cycleTime = 2000;
        if (millis()-caseStartTime>cycleTime) {
          //airpump.setSelected(true);
          //airpump_clicked(pounding, GEvent.CLICKED);
          caseStartTime+=cycleTime;
          cycles--;
          println(cycles%1);

          //outsideBellows.setSelected(boolean(cycles%2));
          //outsideBellows_clicked(outsideBellows, GEvent.CLICKED);
        }
        if (cycles<0) {
          caseRunning=false;
          println("that was chilling");
          //airpump.setSelected(false);
          //airpump_clicked(pounding, GEvent.CLICKED);
        }
        break;
      case 1://massaging
        if (cycles<0)cycles =10;
        cycleTime = 1000;
        if (millis()-caseStartTime>cycleTime) {
          pounding.setSelected(boolean(int(random(2))));
          pounding_clicked(pounding, GEvent.CLICKED);
          kneading.setSelected(boolean(int(random(2))));
          kneading_clicked(pounding, GEvent.CLICKED);

          caseStartTime+=cycleTime;
          cycles--;
          //println(cycles);
        }
        if (cycles<0) {
          caseRunning=false;
          println("that was massaging");
        }
        break;
      case 2://talking
        if (!audioVoice.isPlaying()) {
          if (cycles<1) {
            speech_click(speech, GEvent.CLICKED);
            cycles = 1;
          } else {
            caseRunning=false;
            cycles = -1;
            println("that was talking");
          }
        }
        if (!audioVoice.isPlaying()) {
        }
        break;
      }
    }

    /*
    if ( !audioPlayer.isPlaying())  audioPlayer.loop();
     
     if (!pounding.isSelected()) {
     pounding.setSelected(true);
     pounding_clicked(pounding, GEvent.CLICKED);
     }
     if (!kneading.isSelected()) {
     kneading.setSelected(true);
     kneading_clicked(pounding, GEvent.CLICKED);
     }
     } else {
     if ( audioPlayer.isPlaying() ) {
     audioPlayer.pause();
     }
     */
  }

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

void speak(){
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
  airpump.setSelected(false);
  airpump_clicked(airpump, GEvent.CLICKED);
  shoulders.setSelected(false);
  shoulders_clicked(shoulders, GEvent.CLICKED);
  arms.setSelected(false);
  arms_clicked(arms, GEvent.CLICKED);
  legs.setSelected(false);
  legs_clicked(legs, GEvent.CLICKED);
  outsideBellows.setSelected(false);
  outsideBellows_clicked(outsideBellows, GEvent.CLICKED);
  redGreen.setSelected(false);
  redGreen_clicked(redGreen, GEvent.CLICKED);
  chairFlat.setSelected(false);
  chairFlat_clicked(chairFlat, GEvent.CLICKED);
}
