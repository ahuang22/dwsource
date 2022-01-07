int arr[];
int ARRSIZE = 100000;
int MAXVALUE = 100;

void setup() {
  size(400, 200);
  //background(0);
  arr = randomArray(ARRSIZE);
  int t0 = millis();
  int mode0 = findMode0(arr);
  int t1 = millis();
  int mode1 = findMode1(arr);
  int t2 = millis();
  int mode2 = findMode2(arr);
  int t3 = millis();
  println("Counting version mode: " + mode0 + " time: " + (t1 - t0));
  println("Frequency table mode: " + mode1 + " time: " + (t2 -t1));
  println("Sort run count mode: " + mode2 + " time: " + (t3 -t2));

  textSize(128);
  fill(0);
  //text(mode, 0, 128);
  //text(mode2, 200, 128);

}//setup


//count values method
int findMode0(int[] ray) {
  int currentMode = -1;
  int currentModeFreq = -1;
  int val, valFreq;
  for (int i=0; i<ray.length; i++) {
    val = ray[i];
    valFreq = 1;
    for (int j=i+1; j < ray.length; j++) {
      if (ray[j] == val) {
        valFreq++;
      }//frequency count
    }//count individual value
    if ( valFreq > currentModeFreq ) {
      currentMode = val;
      currentModeFreq = valFreq;
    }//update mode
  }//full array frequency count
  return currentMode;
}//findMode0

//frequency table version
int findMode1( int[] ray ) {
  int[] freqs = new int[MAXVALUE];
  for (int i=0; i<ray.length; i++) {
    int val = ray[i];
    freqs[val]++;
  }//create frequency array
  //find largest frequency
  int currentModeFreq = -1;
  int currentMode = -1;
  for (int f=0; f < freqs.length; f++) {
    if ( freqs[f]> currentModeFreq ) {
      currentMode = f;
      currentModeFreq = freqs[f];
    }//update currentMode
  }//find mode
  return currentMode;
}//findMode1

int findMode2(int[] ray) {
  bubleSort(ray);
  int currentRun = 1;
  int currentVal = ray[0];
  int longestRun = -1;
  int longestVal = -1;

  //find the longest run
  for (int i=1; i < ray.length; i++) {
    if (ray[i] == currentVal) {
      currentRun++;
    } //run count
    else {
      if (currentRun > longestRun) {
        longestRun = currentRun;
        longestVal = currentVal;
      } //update longest run
      currentRun = 1;
      currentVal = ray[i];
    }//end of a run
  }//count runs
  return longestVal;
}//findMode2

void printArray(int[] ray) {
  String s = "[ ";
  for (int i=0; i<ray.length; i++) {
    s+= ray[i] + " ";
  }
  s+= "]";
  println(s);
}

void bubleSort(int[] ray) {
  for (int endPos = ray.length-1; endPos >= 0; endPos--) {
    for (int pos=0; pos < endPos; pos++) {
      if (arr[pos] > arr[endPos]) {
        swap(arr, pos, endPos);
      }
    }
  }
}//bubleSort

void swap(int[] ray, int i0, int i1) {
  int t = ray[i0];
  ray[i0] = ray[i1];
  ray[i1] = t;
}//swap

int[] randomArray(int num) {
  int[] values = new int[num];

  for (int i=0; i<values.length; i++) {
    values[i] = int(random(0, MAXVALUE));
  }//random value loop
  return values;
}//randomArray

void displayArray(int[] ray) {
  int barWidth = width / ray.length;
  int x = 0;
  int y = 0;
  fill(255);
  noStroke();
  for (int i=0; i<ray.length; i++) {
    y = height - ray[i];
    rect(x, y, barWidth, ray[i]);
    x+= barWidth;
  }
}//displayArray
