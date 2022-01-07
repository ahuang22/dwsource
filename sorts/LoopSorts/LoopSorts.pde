int arr[];
int ARRSIZE = 50;

void setup() {
  size(400, 400);
  background(0);
  arr = randomArray(ARRSIZE);
}//setup

void draw() {
  background(0);
  displayArray(arr);
}

void bubbleSort(int[] ray) {
  for (int endPos = ray.length-1; endPos >= 0; endPos--) {
    for (int pos=0; pos < endPos; pos++) {
      if (arr[pos] > arr[endPos]) {
        swap(arr, pos, endPos);
      }
    }//inner loop
  }//outer loop
}//bubleSort

void selectionSort(int[] ray) {

  for (int i=0; i < ray.length; i++) {
    int smallPos = i;
    for (int pos=i+1; pos < ray.length; pos++) {
        if (ray[smallPos] > ray[pos]) {
          smallPos = pos;
        }//update smallPos
    }//inner loop
    swap(ray, i, smallPos);
  }//outer loop
}//selectionSort

void insertionSort(int[] ray) {
  for (int sortEnd = 0; sortEnd < ray.length-1; sortEnd++) {
    int insertVal = ray[sortEnd+1];
    int pos = sortEnd + 1;
    for (; pos > 0; pos--) {
      if (ray[pos-1] < insertVal) {
        break;
      }
      else {
        ray[pos] = ray[pos - 1];
      }//shift
    }//inner loop
    ray[pos] = insertVal;
  }//outer loop
}//insertionSort

void swap(int[] ray, int i0, int i1) {
  int t = ray[i0];
  ray[i0] = ray[i1];
  ray[i1] = t;
}//swap

int[] randomArray(int num) {
  int[] values = new int[num];

  for (int i=0; i<values.length; i++) {
    values[i] = int(random(100, 400));
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

void keyPressed() {
  if (key == 'n') {
    arr = randomArray(ARRSIZE);
  }
  else if (key == 'b') {
    bubbleSort(arr);
  }
  else if (key == 's') {
    selectionSort(arr);
  }
  else if (key == 'i') {
    insertionSort(arr);
  }
}
