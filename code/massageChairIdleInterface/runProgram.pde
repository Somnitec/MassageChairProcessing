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
      if (cycles<0)cycles =(int)random(minMassageCycles, maxMassageCycles);
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
      break;
    }
  }
}
