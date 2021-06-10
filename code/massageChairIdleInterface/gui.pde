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
} //_CODE_:pounding:553098:

public void kneading_clicked(GCheckbox source, GEvent event) { //_CODE_:kneading:406306:
  println("kneading - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:kneading:406306:

public void shoulders_clicked(GCheckbox source, GEvent event) { //_CODE_:shoulders:258416:
  println("shoulders - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:shoulders:258416:

public void arms_clicked(GCheckbox source, GEvent event) { //_CODE_:arms:305022:
  println("arms - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:arms:305022:

public void legs_clicked(GCheckbox source, GEvent event) { //_CODE_:legs:989793:
  println("legs - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:legs:989793:

public void outsideBellows_clicked(GCheckbox source, GEvent event) { //_CODE_:outsideBellows:931493:
  println("outsideBellows - GCheckbox >> GEvent." + event + " @ " + millis());
} //_CODE_:outsideBellows:931493:

public void massagePos_change(GSlider source, GEvent event) { //_CODE_:massagePos:911197:
  println("slider1 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:massagePos:911197:

public void chairPos_change(GSlider source, GEvent event) { //_CODE_:chairPos:409755:
  println("chairPos - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:chairPos:409755:

public void pound_click(GButton source, GEvent event) { //_CODE_:pound:906118:
  println("pound - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:pound:906118:

public void knead_click(GButton source, GEvent event) { //_CODE_:knead:475778:
  println("knead - GButton >> GEvent." + event + " @ " + millis());
  knead();
} //_CODE_:knead:475778:

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
  shoulders = new GCheckbox(this, 10, 90, 120, 20);
  shoulders.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  shoulders.setText("shoulders");
  shoulders.setOpaque(false);
  shoulders.addEventHandler(this, "shoulders_clicked");
  arms = new GCheckbox(this, 10, 70, 120, 20);
  arms.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  arms.setText("arms");
  arms.setOpaque(false);
  arms.addEventHandler(this, "arms_clicked");
  legs = new GCheckbox(this, 10, 50, 120, 20);
  legs.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  legs.setText("legs");
  legs.setOpaque(false);
  legs.addEventHandler(this, "legs_clicked");
  outsideBellows = new GCheckbox(this, 10, 110, 120, 20);
  outsideBellows.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  outsideBellows.setText("outsideBellows");
  outsideBellows.setOpaque(false);
  outsideBellows.addEventHandler(this, "outsideBellows_clicked");
  massagePos = new GSlider(this, 10, 130, 120, 40, 10.0);
  massagePos.setShowValue(true);
  massagePos.setLimits(0.0, 0.0, 1.0);
  massagePos.setNumberFormat(G4P.DECIMAL, 2);
  massagePos.setOpaque(false);
  massagePos.addEventHandler(this, "massagePos_change");
  chairPos = new GSlider(this, 10, 170, 120, 40, 10.0);
  chairPos.setShowValue(true);
  chairPos.setLimits(0.0, 0.0, 1.0);
  chairPos.setNumberFormat(G4P.DECIMAL, 2);
  chairPos.setOpaque(false);
  chairPos.addEventHandler(this, "chairPos_change");
  pound = new GButton(this, 165, 211, 80, 30);
  pound.setText("pound");
  pound.addEventHandler(this, "pound_click");
  knead = new GButton(this, 164, 246, 80, 30);
  knead.setText("knead");
  knead.addEventHandler(this, "knead_click");
  poundingChance = new GSlider(this, 145, 11, 100, 40, 10.0);
  poundingChance.setLimits(0.5, 0.0, 1.0);
  poundingChance.setNumberFormat(G4P.DECIMAL, 2);
  poundingChance.setOpaque(false);
  poundingChance.addEventHandler(this, "poundingChance_change");
  poundingTime = new GSlider(this, 245, 11, 100, 40, 10.0);
  poundingTime.setLimits(0.5, 0.0, 1.0);
  poundingTime.setNumberFormat(G4P.DECIMAL, 2);
  poundingTime.setOpaque(false);
  poundingTime.addEventHandler(this, "poundingTime_change");
  poundingOnTimeBalance = new GSlider(this, 344, 13, 100, 40, 10.0);
  poundingOnTimeBalance.setLimits(0.5, 0.0, 1.0);
  poundingOnTimeBalance.setNumberFormat(G4P.DECIMAL, 2);
  poundingOnTimeBalance.setOpaque(false);
  poundingOnTimeBalance.addEventHandler(this, "poundingOnTimeBalance_change");
  programRunning = new GCheckbox(this, 10, 240, 120, 20);
  programRunning.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  programRunning.setText("programRunning");
  programRunning.setOpaque(false);
  programRunning.addEventHandler(this, "programRunning_clicked");
}

// Variable declarations 
// autogenerated do not edit
GCheckbox pounding; 
GCheckbox kneading; 
GCheckbox shoulders; 
GCheckbox arms; 
GCheckbox legs; 
GCheckbox outsideBellows; 
GSlider massagePos; 
GSlider chairPos; 
GButton pound; 
GButton knead; 
GSlider poundingChance; 
GSlider poundingTime; 
GSlider poundingOnTimeBalance; 
GCheckbox programRunning; 