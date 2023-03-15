class Bubble{
  float x;
  float y;
  float r;
  float yspeed;

//Making the constructor with a float parameter. 
  Bubble(float tempR){
//Making the object's x-position random.
    this.x = random(width);
    this.y = height; 
    this.r = tempR;
//Making the object move at random speed on the y-axis.
    this.yspeed = random(0.5,2.5);
  
  }
//Creating the body of the object. 
  void display(){
     fill(150,150);
     strokeWeight(1);
     stroke(0);
     ellipse(x,y,r*2,r*2);
  }
//Making the object 'ascend' from the bottom to the top of the screen. 
  void ascend(){
    y = y - yspeed;
    x = x + random(-2,2);
  }
//Making the bubble reset to the bottom after hitting the edge on top of the screen. 
  void top(){
    if(y < r/2){
      y = height;
    }
  }

// Making the bobbles able to pop, by returning a boolean if the position of the mouse equals the bubbles position and the mouse is pressed aswell.
  boolean popBubbles(){
    if(abs(mouseX-x)+abs(mouseY-y) <= r && mousePressed){
      return true;
    }
    return false;
  }
}
