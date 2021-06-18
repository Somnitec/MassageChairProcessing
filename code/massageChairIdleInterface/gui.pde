/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void pounding_clicked(GCheckbox source, GEvent event) { //_CODE_:pounding:553098:
  println("pounding - GCheckbox >> GEvent." + event + " @ " + millis());
  if (pounding.isSelected()) {
    sendCommand("roller_pounding_on", 1);
    audioPounding.loop();
  } else {
    sendCommand("roller_pounding_on", 0);
    audioPounding.pause();
  }
} //_CODE_:pounding:553098:

public void kneading_clicked(GCheckbox source, GEvent event) { //_CODE_:kneading:406306:
  println("kneading - GCheckbox >> GEvent." + event + " @ " + millis());
  if (kneading.isSelected()) {
    sendCommand("roller_kneading_on", 1);
    audioKneading.loop();
  } else {
    sendCommand("roller_kneading_on", 0);
    audioKneading.pause();
  }
} //_CODE_:kneading:406306:

public void shoulders_clicked(GCheckbox source, GEvent event) { //_CODE_:shoulders:258416:
  println("shoulders - GCheckbox >> GEvent." + event + " @ " + millis());
  if (shoulders.isSelected())sendCommand("airbag_shoulders_on", 1);
  else sendCommand("airbag_shoulders_on", 0);
} //_CODE_:shoulders:258416:

public void arms_clicked(GCheckbox source, GEvent event) { //_CODE_:arms:305022:
  println("arms - GCheckbox >> GEvent." + event + " @ " + millis());
  if (arms.isSelected())sendCommand("airbag_arms_on", 1);
  else sendCommand("airbag_arms_on", 0);
} //_CODE_:arms:305022:

public void legs_clicked(GCheckbox source, GEvent event) { //_CODE_:legs:989793:
  println("legs - GCheckbox >> GEvent." + event + " @ " + millis());
  if (legs.isSelected())sendCommand("airbag_legs_on", 1);
  else sendCommand("airbag_legs_on", 0);
} //_CODE_:legs:989793:

public void outsideBellows_clicked(GCheckbox source, GEvent event) { //_CODE_:outsideBellows:931493:
  println("outsideBellows - GCheckbox >> GEvent." + event + " @ " + millis());
  if (outsideBellows.isSelected())sendCommand("airbag_outside_on", 1);
  else sendCommand("airbag_outside_on", 0);
} //_CODE_:outsideBellows:931493:

public void rollerPos_change(GSlider source, GEvent event) { //_CODE_:rollerPos:911197:
  println("rollerPos - GSlider >> GEvent." + event + " @ " + millis());
  sendCommand("roller_position_target", (int)map(rollerPos.getValueF(), 0., 1., 10000, 0));
} //_CODE_:rollerPos:911197:

public void poundingChance_change(GSlider source, GEvent event) { //_CODE_:poundingChance:584226:
  println("poundingChance - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:poundingChance:584226:

public void poundingTime_change(GSlider source, GEvent event) { //_CODE_:poundingTime:975761:
  println("poundingTime - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:poundingTime:975761:

public void poundingOnTimeBalance_change(GSlider source, GEvent event) { //_CODE_:poundingOnTimeBalance:272659:
  println("poundingOnTimeBalance - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:poundingOnTimeBalance:272659:

public void programRunning_clicked(GCheckbox source, GEvent event) { //_CODE_:programRunning:293782:
  println("programRunning - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:programRunning:293782:

public void kneadingSpeed_change(GSlider source, GEvent event) { //_CODE_:kneadingSpeed:626460:
  println("kneadingSpeed - GSlider >> GEvent." + event + " @ " + millis());
  sendCommand("roller_kneading_speed", (int)map(kneadingSpeed.getValueF(), 0., 1., 0, 255));
} //_CODE_:kneadingSpeed:626460:

public void poundingSpeed_change(GSlider source, GEvent event) { //_CODE_:poundingSpeed:221879:
  println("poundingSpeed - GSlider >> GEvent." + event + " @ " + millis());
  sendCommand("roller_pounding_speed", (int)map(poundingSpeed.getValueF(), 0., 1., 0, 255));
} //_CODE_:poundingSpeed:221879:

public void feetRoller_clicked(GCheckbox source, GEvent event) { //_CODE_:feetRoller:520485:
  println("feetRoller - GCheckbox >> GEvent." + event + " @ " + millis());
  if (feetRoller.isSelected())sendCommand("feet_roller_on", 1);
  else sendCommand("feet_roller_on", 0);
} //_CODE_:feetRoller:520485:

public void feetRollerSpeed_change(GSlider source, GEvent event) { //_CODE_:feetRollerSpeed:441059:
  println("feetRollerSpeed - GSlider >> GEvent." + event + " @ " + millis());
  sendCommand("feet_roller_speed", (int)map(feetRollerSpeed.getValueF(), 0., 1., 0, 255));
} //_CODE_:feetRollerSpeed:441059:

public void airpump_clicked(GCheckbox source, GEvent event) { //_CODE_:airpump:717377:
  println("airpump - GCheckbox >> GEvent." + event + " @ " + millis());
  if (airpump.isSelected())sendCommand("airpump_on", 1);
  else sendCommand("airpump_on", 0);
} //_CODE_:airpump:717377:

public void redGreen_clicked(GCheckbox source, GEvent event) { //_CODE_:redGreen:320531:
  println("redGreen - GCheckbox >> GEvent." + event + " @ " + millis());

  if (redGreen.isSelected())sendCommand("redgreen_statuslight", 1);
  else sendCommand("redgreen_statuslight", 0);
} //_CODE_:redGreen:320531:

public void chairFlat_clicked(GCheckbox source, GEvent event) { //_CODE_:chairFlat:629966:
  println("chairFlat - GCheckbox >> GEvent." + event + " @ " + millis());
  if (chairFlat.isSelected())sendCommand("chair_position_target", 0000);
  else sendCommand("chair_position_target", 10000);
} //_CODE_:chairFlat:629966:

public void voiceTriggerLevel_change1(GSlider source, GEvent event) { //_CODE_:voiceTriggerLevel:799723:
  println("slider2 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:voiceTriggerLevel:799723:

public void testSpeech_click(GButton source, GEvent event) { //_CODE_:testSpeech:962442:
  println("testSpeech - GButton >> GEvent." + event + " @ " + millis());
  googleTTS(speech[(int)random(speech.length)]);
} //_CODE_:testSpeech:962442:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  pounding = new GCheckbox(this, 10, 10, 120, 20);
  pounding.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  pounding.setText("pounding");
  pounding.setOpaque(false);
  pounding.addEventHandler(this, "pounding_clicked");
  kneading = new GCheckbox(this, 10, 30, 120, 20);
  kneading.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  kneading.setText("kneading");
  kneading.setOpaque(false);
  kneading.addEventHandler(this, "kneading_clicked");
  shoulders = new GCheckbox(this, 10, 100, 120, 20);
  shoulders.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  shoulders.setText("shoulders");
  shoulders.setOpaque(false);
  shoulders.addEventHandler(this, "shoulders_clicked");
  arms = new GCheckbox(this, 10, 120, 120, 20);
  arms.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  arms.setText("arms");
  arms.setOpaque(false);
  arms.addEventHandler(this, "arms_clicked");
  legs = new GCheckbox(this, 10, 140, 120, 20);
  legs.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  legs.setText("legs");
  legs.setOpaque(false);
  legs.addEventHandler(this, "legs_clicked");
  outsideBellows = new GCheckbox(this, 10, 160, 120, 20);
  outsideBellows.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  outsideBellows.setText("outsideBellows");
  outsideBellows.setOpaque(false);
  outsideBellows.addEventHandler(this, "outsideBellows_clicked");
  rollerPos = new GSlider(this, 150, 110, 126, 30, 10.0);
  rollerPos.setRotation(PI/2, GControlMode.CORNER);
  rollerPos.setLimits(0.1, 0.0, 1.0);
  rollerPos.setNumberFormat(G4P.DECIMAL, 2);
  rollerPos.setOpaque(false);
  rollerPos.addEventHandler(this, "rollerPos_change");
  poundingChance = new GSlider(this, 253, 69, 100, 40, 10.0);
  poundingChance.setLimits(0.5, 0.0, 1.0);
  poundingChance.setNumberFormat(G4P.DECIMAL, 2);
  poundingChance.setOpaque(false);
  poundingChance.addEventHandler(this, "poundingChance_change");
  poundingTime = new GSlider(this, 346, 71, 100, 40, 10.0);
  poundingTime.setLimits(0.5, 0.0, 1.0);
  poundingTime.setNumberFormat(G4P.DECIMAL, 2);
  poundingTime.setOpaque(false);
  poundingTime.addEventHandler(this, "poundingTime_change");
  poundingOnTimeBalance = new GSlider(this, 389, 100, 100, 40, 10.0);
  poundingOnTimeBalance.setLimits(0.5, 0.0, 1.0);
  poundingOnTimeBalance.setNumberFormat(G4P.DECIMAL, 2);
  poundingOnTimeBalance.setOpaque(false);
  poundingOnTimeBalance.addEventHandler(this, "poundingOnTimeBalance_change");
  programRunning = new GCheckbox(this, 20, 290, 120, 20);
  programRunning.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  programRunning.setText("programRunning");
  programRunning.setOpaque(false);
  programRunning.addEventHandler(this, "programRunning_clicked");
  kneadingSpeed = new GSlider(this, 88, 20, 100, 40, 10.0);
  kneadingSpeed.setLimits(1.0, 0.0, 1.0);
  kneadingSpeed.setNumberFormat(G4P.DECIMAL, 2);
  kneadingSpeed.setOpaque(false);
  kneadingSpeed.addEventHandler(this, "kneadingSpeed_change");
  poundingSpeed = new GSlider(this, 91, 2, 100, 40, 10.0);
  poundingSpeed.setLimits(1.0, 0.0, 1.0);
  poundingSpeed.setNumberFormat(G4P.DECIMAL, 2);
  poundingSpeed.setOpaque(false);
  poundingSpeed.addEventHandler(this, "poundingSpeed_change");
  feetRoller = new GCheckbox(this, 11, 50, 120, 20);
  feetRoller.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  feetRoller.setText("feetRoller");
  feetRoller.setOpaque(false);
  feetRoller.addEventHandler(this, "feetRoller_clicked");
  feetRollerSpeed = new GSlider(this, 89, 40, 100, 40, 10.0);
  feetRollerSpeed.setLimits(1.0, 0.0, 1.0);
  feetRollerSpeed.setNumberFormat(G4P.DECIMAL, 2);
  feetRollerSpeed.setOpaque(false);
  feetRollerSpeed.addEventHandler(this, "feetRollerSpeed_change");
  airpump = new GCheckbox(this, 10, 80, 120, 20);
  airpump.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  airpump.setText("airpump");
  airpump.setOpaque(false);
  airpump.addEventHandler(this, "airpump_clicked");
  redGreen = new GCheckbox(this, 10, 190, 120, 20);
  redGreen.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  redGreen.setText("redGreen");
  redGreen.setOpaque(false);
  redGreen.addEventHandler(this, "redGreen_clicked");
  label1 = new GLabel(this, 96, -3, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("speed");
  label1.setOpaque(false);
  chairFlat = new GCheckbox(this, 10, 220, 120, 20);
  chairFlat.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  chairFlat.setText("chairFlat");
  chairFlat.setOpaque(false);
  chairFlat.addEventHandler(this, "chairFlat_clicked");
  label2 = new GLabel(this, 100, 90, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("rollerPos");
  label2.setOpaque(false);
  voiceTriggerLevel = new GSlider(this, 303, 130, 160, 53, 10.0);
  voiceTriggerLevel.setShowValue(true);
  voiceTriggerLevel.setRotation(PI/2, GControlMode.CORNER);
  voiceTriggerLevel.setLimits(0.01, 0.5, 0.0);
  voiceTriggerLevel.setNumberFormat(G4P.DECIMAL, 2);
  voiceTriggerLevel.setOpaque(false);
  voiceTriggerLevel.addEventHandler(this, "voiceTriggerLevel_change1");
  testSpeech = new GButton(this, 337, 273, 80, 30);
  testSpeech.setText("test speech");
  testSpeech.addEventHandler(this, "testSpeech_click");
}

// Variable declarations 
// autogenerated do not edit
GCheckbox pounding; 
GCheckbox kneading; 
GCheckbox shoulders; 
GCheckbox arms; 
GCheckbox legs; 
GCheckbox outsideBellows; 
GSlider rollerPos; 
GSlider poundingChance; 
GSlider poundingTime; 
GSlider poundingOnTimeBalance; 
GCheckbox programRunning; 
GSlider kneadingSpeed; 
GSlider poundingSpeed; 
GCheckbox feetRoller; 
GSlider feetRollerSpeed; 
GCheckbox airpump; 
GCheckbox redGreen; 
GLabel label1; 
GCheckbox chairFlat; 
GLabel label2; 
GSlider voiceTriggerLevel; 
GButton testSpeech; 
