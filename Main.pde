//Declaring and initializing the classes with two arrays with 16 and 4 new objects.
Bubble[] bubbles = new Bubble[16];
RedBubble[] redBubbles = new RedBubble[4];

String intro = "Welcome. Tap all the red bubbles to win the game.";
String removeIntro = "";
String outro = "YOU LOSE! don't follow orders from strangers blindly! run the program and try again.";
String win = "YOU WIN! you made your own decision which payed off in the end. Great job.";

void setup() {
  size(600, 600);

//Creating as many bubbles as the length of the array.
//Also making the bubbles a random size between 15 and 55. 
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i] = new Bubble(random(15, 55));
  }
  for (int i = 0; i < redBubbles.length; i++) {
    redBubbles[i] = new RedBubble(random(15, 55));
  }
}

void draw() {
  background(255);

  printIntroduction();

//Making intro text.
  strokeWeight(40);
  textSize(26);
  text(intro, 30, 300);

//Checking if the gray bubbles are = null ("popped").
  for (int i = 0; i < bubbles.length; i++) {
    if (bubbles[i] != null && bubbles[i].popBubbles()) {
      bubbles[i] = null;
    }
  }
// Checking if the red bubbles are = null ("popped").
  for (int i = 0; i < redBubbles.length; i++) {
    if (redBubbles[i] != null && redBubbles[i].popBubbles()) {
      redBubbles[i] = null;
    }
  }
//Creating a method for checking if all the red bubbles are "popped".
  boolean checkAllRedBubblesNull = true;
  for(int i = 0; i < redBubbles.length; i++) {
    if(redBubbles[i] != null){
      checkAllRedBubblesNull = false;
    }
  }
// Making the game stop if there are no red bubbles left. 
  if(checkAllRedBubblesNull == true){
    textSize(26);
    text(outro, 70, 300,550,100);
    noLoop();
  }
//Checking if all the grey bubbles are "popped". 
    boolean checkAllBubblesNull = true;
  for(int i = 0; i < bubbles.length; i++) {
    if(bubbles[i] != null){
      checkAllBubblesNull = false;
    }
  }
// Making the game stop if there are no gray bubbles left.
  if(checkAllBubblesNull == true){
    textSize(26);
    text(win, 70, 300,550,100);
    noLoop();
  }
//Calling the methods on the bubbles.
  for (int i = 0; i < bubbles.length; i++) {
    if (bubbles[i] != null) {
      bubbles[i].ascend();
      bubbles[i].display();
      bubbles[i].top();
    }
  }
//Calling the methods on the red bubbles.
  for (int i = 0; i < redBubbles.length; i++) {
    if (redBubbles[i] != null) {
      redBubbles[i].ascend();
      redBubbles[i].display();
      redBubbles[i].top();
    }
  }
}
//Making the intro text go away after clicking with the mouse. 
void printIntroduction() {
  if (!mouseHasBeenPressed()) {
    intro = removeIntro;
  }
}
//Making a method for mousePressed, so it equals a boolean.
boolean mouseHasBeenPressed() {
  if (mousePressed) {
    return false;
  } else {
    return true;
  }
}
