//name: Sitong Chen
//date: 3-4-17
//purpose: painting

//define photo
PImage photo;
void setup()
{
  size(700, 700);     //size of background
  clearBackground();    //background function, run one time first
  
}
//draw function
void draw()
{
  
}
//define variable for button position and button size
float buttonX = 10;
float buttonY = 235;
float buttoSize = 60;
//create background function for clear the background
void clearBackground()
{
  background(250);          //color of background
  photo = loadImage("background.png");      //load image
  image(photo, 0, 0);      
  
  //create buttons
  noStroke();
  fill(#E06868);
  rect(buttonX, buttonY, buttoSize, buttoSize);    //red button
  
  fill(#E0E068);
  rect(buttonX, buttonY+buttoSize+10, buttoSize,buttoSize);    //yellow button
   
  fill(#68A9E0);
  rect(buttonX, buttonY+(buttoSize*2)+20, buttoSize,buttoSize);     //blue button
  
  fill(#8ED8A0);
  rect(buttonX, buttonY+(buttoSize*3)+30, buttoSize,buttoSize);    //green button
  
  fill(#CE8ED8);
  rect(buttonX, buttonY+(buttoSize*4)+40, buttoSize,buttoSize);     //purple button
  
  fill(190);
  rect(buttonX, buttonY-55, buttoSize, buttoSize-20);          //eraser button
  fill(0);
  text("ERASER", buttonX+5, buttonY-30);
  
  fill(0);
  rect(buttonX, buttonY+(buttoSize*5)+50, buttoSize, buttoSize);    //black button
  
  fill(100);                                                             //superise button
  rect(buttonX, buttonY+(buttoSize*6)+60, buttoSize, buttoSize-20);
  fill(240);
  ellipseMode(CENTER);
  ellipse(buttonX+buttoSize/2, 675,35, 35);
    
}
//define color variables and brush size
int R = 0;
int G = 0;
int B = 0;
int brushSize = 3;
//create draw function
void penDraw()
{
  //draw line with a blackcolor
  stroke(R, G, B);
  strokeWeight(brushSize);
  line(pmouseX, pmouseY, mouseX, mouseY);
  //conditions for change brush size
  if(key == '1')
  {
    brushSize = 3;
    
  }
  if(key == '2')
  {
    brushSize = 5;
    
  }
  if(key == '3')
  {
    brushSize = 10;
    
  }
  if(key == '4')
  {
    brushSize = 15;
    
  }
  if(key == '5')
  {
    brushSize = 20;
  }
}

//define boolean variables
boolean redButtonClick;
boolean yellowButtonClick;
boolean blueButtonClick;
boolean greenButtonClick;
boolean purpleButtonClick;
boolean eraserButtonClick;
boolean blackButtonClick;

//mouse clicked functions
void mouseClicked()
{
  //check if the button is pressed
  if ((mouseX >buttonX) && (mouseX < buttonX+buttoSize)){
    //red button clicked
    if ((mouseY >buttonY) && (mouseY < buttonY+buttoSize)){
      redButtonClick = true;
      yellowButtonClick = false;
      blueButtonClick = false;
      greenButtonClick = false;
      purpleButtonClick = false;
      eraserButtonClick = false;
      blackButtonClick = false;
    }
    //yellow button clicked
    if ((mouseY >buttonY+buttoSize+10) && (mouseX < buttonY+buttoSize+10+buttoSize)){
      redButtonClick = false;
      yellowButtonClick = true;
      blueButtonClick = false;
      greenButtonClick = false;
      purpleButtonClick = false;
      eraserButtonClick = false;
      blackButtonClick = false;
    }
    //bulue button clicked
    if ((mouseY >buttonY+(buttoSize*2)+20) && (mouseY < buttonY+(buttoSize*2)+20+buttoSize)){
      redButtonClick = false;
      yellowButtonClick = false;
      blueButtonClick = true;
      greenButtonClick = false;
      purpleButtonClick = false;
      eraserButtonClick = false;
      blackButtonClick = false;
    }
    //green button clicked
    if ((mouseY >buttonY+(buttoSize*3)+30) && (mouseY < buttonY+(buttoSize*3)+30+buttoSize)){
      redButtonClick = false;
      yellowButtonClick = false;
      blueButtonClick = false;
      greenButtonClick = true;
      purpleButtonClick = false;
      eraserButtonClick = false;
      blackButtonClick = false;
    }
    //perple button clicked
    if ((mouseY >buttonY+(buttoSize*4)+40) && (mouseY < buttonY+(buttoSize*4)+40+buttoSize)){
      redButtonClick = false;
      yellowButtonClick = false;
      blueButtonClick = false;
      greenButtonClick = false;
      purpleButtonClick = true;
      eraserButtonClick = false;
      blackButtonClick = false;
    }
    //eraser button clicked
    if ((mouseY >buttonY-55) && (mouseY < (buttonY-55)+(buttoSize-20))){
      redButtonClick = false;
      yellowButtonClick = false;
      blueButtonClick = false;
      greenButtonClick = false;
      purpleButtonClick = false;
      eraserButtonClick = true;
      blackButtonClick = false;
    }
    //black button clicked
    if ((mouseY >buttonY+(buttoSize*5)+50) && (mouseY < buttonY+(buttoSize*5)+50+buttoSize)){
      redButtonClick = false;
      yellowButtonClick = false;
      blueButtonClick = false;
      greenButtonClick = false;
      purpleButtonClick = false;
      eraserButtonClick = false;
      blackButtonClick = true;
    }
    //surprise button clicked loop
    if ((mouseY >buttonY+(buttoSize*6)+60) && (mouseY < buttonY+(buttoSize*6)+60+buttoSize)){
      for(int i = 0; i < 50; i++)
      {
        fill(100);
        noStroke();
        ellipse(random(100,660), random(210,660), 20,20);
      }    
    }
  }  
}
//define variable to save image
int saveNumber = 1;
//key pressed function
void keyPressed()
{
  //if pressc,run background function to clear background
  if(key == 'c')
  {
    clearBackground();
  }
  //if press s, screen shot and save the image
  if(key == 's')
  {
    save("Screen" + saveNumber + ".png");
    saveNumber = saveNumber + 1;
  }
  //run pen draw function to change brush size by pressing 1-5 number
  penDraw();
}

//mouse dragged function
void mouseDragged()
{  
  //condition for drawing, if mouse in the canvas, draw line
  if((mouseX > 80) && (mouseY > 180))
  {
    //run pen draw function, draw black line without click buttons
    penDraw();
     //conditions for clicked buttons and change the brush color
     //red brush
     if(redButtonClick == true){
       println("red");     
       R = 224;
       G = 104;
       B = 104;
       penDraw();
     }
     //yellow brush
     if(yellowButtonClick == true){
       println("yellow");     
       R = 224;
       G = 224;
       B = 104;
       penDraw();
     }
     //blue brush
     if(blueButtonClick == true){
       println("blue");     
       R = 104;
       G = 169;
       B = 224;
       penDraw();
     }
     //green brush
     if(greenButtonClick == true){
       println("green");     
       R = 142;
       G = 216;
       B = 160;
       penDraw();
     }
     //purple brush
     if(purpleButtonClick == true){
       println("purple");     
       R = 206;
       G = 142;
       B = 216;
       penDraw();
     }
     //white brush(eraser)
     if(eraserButtonClick == true){
       println("eraser");     
       stroke(250);
       strokeWeight(20);
       line(pmouseX, pmouseY, mouseX,mouseY);
     }
     //back to blackbrush
     if(blackButtonClick == true){
       println("black");  
       R = 0;
       G = 0;
       B = 0;
       penDraw();
     }
  }  
}