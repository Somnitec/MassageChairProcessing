int minMassageCycles =5;
int maxMassageCycles=10;

int minChillTime = 2;//seconds
int maxChillTime = 5;

int minMassageTime = 1000;
int  maxMassageTime = 2000;

int maxMassageItems = 5;


int massageItems = 9;
boolean[] massageActive = new boolean[massageItems];
boolean caseRunning = false;
int currentCase =0;
int caseStartTime;
int cycles=0;
int cycleTime;

boolean breathIn = false;
int breathTimer = 0;

void runProgram() {

  if (shoulders.isSelected()||arms.isSelected()||legs.isSelected()||outsideBellows.isSelected()) {
    if (!airpump.isSelected() ) {
      airpump.setSelected(true);
      airpump_clicked(pounding, GEvent.CLICKED);
    }
  } else {
    if (airpump.isSelected() ) {
      airpump.setSelected(false);
      airpump_clicked(pounding, GEvent.CLICKED);
    }
  }



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
      outsideBellows.setSelected(true);
      outsideBellows_clicked(outsideBellows, GEvent.CLICKED);
    } else {
      println("breath out");

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
    if(currentCase==0)currentState.setText("chilling");
    if(currentCase==1)currentState.setText("massaging");
    if(currentCase==2)currentState.setText("talking");
    if (currentCase!=2) {
      rollerPos.setValue(random(1.));
      rollerPos_change(rollerPos, GEvent.CLICKED);
    }
  } else {
    switch (currentCase) {
    case 0://chilling
      if (cycles<0)cycles =(int)random(minChillTime, maxChillTime);
      cycleTime = 1000;
      if (millis()-caseStartTime>cycleTime) {
        //airpump.setSelected(true);
        //airpump_clicked(pounding, GEvent.CLICKED);
        caseStartTime+=cycleTime;
        cycles--;
        println(cycles%1);
      }
      if (cycles<0) {
        caseRunning=false;
        println("that was chilling");
      }
      break;
    case 1://massaging
      if (cycles<0) {
        cycles =(int)random(minMassageCycles, maxMassageCycles);
        for (int i = 0; i<massageItems; i++) {
          massageActive[i]=false;
        }
        int massageNo = (int)random(maxMassageItems);
        for (int i = 0; i<massageNo; i++) {
          massageActive[(int)random(massageItems)]=true;
        }
        cycleTime = (int) random(minMassageTime, maxMassageTime);
      }

      if (millis()-caseStartTime>cycleTime) {
        if (massageActive[0]||massageActive[2]||massageActive[4]||massageActive[6]) {
          pounding.setSelected(boolean(int(random(2))));
          pounding_clicked(pounding, GEvent.CLICKED);
        }
        if (massageActive[1]||massageActive[3]) {
          kneading.setSelected(boolean(int(random(2))));
          kneading_clicked(pounding, GEvent.CLICKED);
        }
        if (massageActive[2]||massageActive[5]) {
          feetRoller.setSelected(boolean(int(random(2))));
          feetRoller_clicked(feetRoller, GEvent.CLICKED);
        }
        if (massageActive[3]) {
          shoulders.setSelected(boolean(int(random(2))));
          shoulders_clicked(shoulders, GEvent.CLICKED);
        }
        if (massageActive[4]) {
          arms.setSelected(boolean(int(random(2))));
          arms_clicked(arms, GEvent.CLICKED);
        }
        if (massageActive[5]) {
          legs.setSelected(boolean(int(random(2))));
          legs_clicked(legs, GEvent.CLICKED);
        }
        if (massageActive[6]) {
          redGreen.setSelected(boolean(int(random(2))));
          redGreen_clicked(redGreen, GEvent.CLICKED);
        }
        if (massageActive[7]) {
          chairFlat.setSelected(boolean(int(random(2))));
          chairFlat_clicked(chairFlat, GEvent.CLICKED);
        }
        if (massageActive[8]) {
          rollerPos.setValue(random(1.));
          rollerPos_change(rollerPos, GEvent.CLICKED);
        }


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
          audioPounding.mute();
          audioKneading.mute();


          pounding.setSelected(true);
          pounding_clicked(pounding, GEvent.CLICKED);
          kneading.setSelected(true);
          kneading_clicked(pounding, GEvent.CLICKED);
          delay(1000);
          speech_click(speech, GEvent.CLICKED);
          cycles = 1;
        } else {
          caseRunning=false;
          cycles = -1;
          println("that was talking");
        }
      }
      break;
    }
  }
}
