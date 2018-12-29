//name: Sitong Chen
//class: IGME.101.02
//date: 4-1-17
//purpose: Alleged Art

//initial 2d array for third drawing part
int columnCount = 10;   //declare column count
int rowCount = 10;    //declare row count
color[][] matrix;    //declare 2d array

//initial arrays for the fifth drawing part
int[] treePosX;   //declare position x array
int[] treePosY;   //declare position y array
int[] treePosX2;
int[] treePosY2;

void setup()
{
  size(800, 800);   //size of window
  background(50);   //default background color
  
  //creat the matrix array for third
  matrix = new color[rowCount][columnCount];
  
  //create position x and y array for fifth part
  treePosX = new int[3];
  treePosY = new int[3];
  
  treePosX2 = new int[3];
  treePosY2 = new int[3];
  
  //call the first drawing part
  drawRectangle(columnCount, rowCount); 
  
  //call the array to assign data to treePosX and treePosY
  fillTreeArray(treePosX, treePosY);
  fillTreeArray2(treePosX2, treePosY2);
    
}

//set variables for fame counter
int frameCounter = 0;
int currentFrame = 0;

//set bool valiable to check the time to determin wheather animation played
boolean checkTime = true;
//set bool variable to change background when mouse clicked during the third scence
boolean catBackground;
void draw()
{  
  //if checkTime is true, count the frame and play the animation
  if(checkTime)
  {
    fillMatrix(matrix);     //assign data to 2d array
    //if frame is larger than 1000, play the first animation
    if (frameCounter > 1000 && frameCounter < 1200)
    {
      updateShape(5, 5);
    }   
    //if frame islarger than 1200, play the second animation
    if (frameCounter >= 1200 && frameCounter < 1400)
    {      
      background(#A5B5ED);
      drawTree(treePosX2, treePosY2);    //draw the first layer
      drawTree(treePosX, treePosY);     //draw the second layer
      moveTree(treePosX, 10);     //move the first layer
      moveTree(treePosX2, 5);     //move the second layer
    }
    //if frame islarger than 1400, play the third scence
    if(frameCounter >= 1400)
    {
      background(#ECF7DE);
      //for loop to draw three cats in the window
      for(int i = 1; i < 4; i++)
      {
        drawCat(200 * i, height/2);
      }
      catBackground = true;
    }
    //increasing manually the counter
    frameCounter+=1;
    currentFrame = frameCounter ;
    println(currentFrame);   //print frame 
  }  
}

//set a boolean variable to draw the gray rectangle and red circle
boolean gray = true;
boolean circle;
void mouseClicked()
{
  //if gray is true, call drawGrayRect function
  if(gray)
  {
    drawGrayRect();
    println("draw rectangle");
  }
  
  //if circle is true, call drawRedCircle function and stop to draw gray rectangle
  if(circle)
  {
    gray = false;
    drawRedCircle();
    println("draw circle");
  }
  
  //if the third scence played, can change the background color by click window
  if(catBackground)
  {
    checkTime = false;
    colorMode(HSB);
    color bColor;
    bColor = color(int(random(0,100)), 23, 80);
    background(bColor);
    for(int i = 1; i < 4; i++)
    {
      drawCat(200 * i, height/2);
    }
  }
}

//set a variable number for save image number
int saveNumber= 1;
void keyPressed()
{
  //press c key to change the scence to the second drawing part
  if(key == 'c')
  {    
    updateColor(matrix);    //calling the second drawing part, changing by press key
    circle = false;
    gray = true;
    println("change");
  }
  //press e key to make bool variable to true, and draw red circle when mouse clicked
  if(key == 'e')
  {
    circle = true; 
  }
  //press s key to stop animation
  if(key == 's')
  {
    println("stop");
    checkTime = false; 
    circle = false;
    gray = true;
  }  
  //after stop animation, press p key to play again
  if(key == 'p')
  {
    println("play");
    checkTime = true;
  }
  //press r key to change back to drawing gray rectangle
  if(key == 'r')
  {
    gray = true;
    circle = false;
  }
  //press 1 to save the image
  if(key == '1')
  {
    save("ScreenShot" + saveNumber + ".png");
    saveNumber++;
  }
}

//FIRST scene

// drawRectangle()
// Params: the number of row and column
// Returns: none
// draw the first part of art, fill the rectangle in the window
void drawRectangle(int rowNumber, int columnNumber)
{
  int sizeW = width/columnNumber;
  int sizeH = height/rowNumber;
  
  fill(200);
  stroke(150);
  int posY = 0;  
  for(int row = 0; row < rowNumber; row++)
  {
    int posX = 0;
    for(int column = 0; column < columnNumber; column++)
    {
      rect(posX, posY, sizeW, sizeH);
      posX = posX + sizeW;
    }
    posY = posY + sizeH;
  }
}

//USER DRAWING PART

// drawGrayRect()
// Params: none
// Returns: none
// get the number of column and row, draw the black rectangle when mouse is clicked
void drawGrayRect()
{
  println("mouse: ( " + mouseX + " , " + mouseY + " )");
  int column = mouseX / (width/columnCount);
  int row = mouseY / (height/rowCount);
  println("Column: " + column + " ,Row: " + row);
  fill(70);
  rect(column*(width/columnCount), row*(height/rowCount), width/columnCount, height/rowCount);
}
// drawGrayCircle()
// Params: none
// Returns: none
// get the number of column and row, draw the red circle when mouse is clicked
void drawRedCircle()
{
  println("mouse: ( " + mouseX + " , " + mouseY + " )");
  int column = mouseX / (width/columnCount);
  int row = mouseY / (height/rowCount);
  println("Column: " + column + " ,Row: " + row);
  fill(227, 228, 232, 50);
  ellipse(column*(width/columnCount), row*(height/rowCount), 150, 150);
}

//SECOND scene

// fillMatrix()
// Params: 2d array
// Returns: none
// assign data to matrix1 array
void fillMatrix(color[][] array)
{
  for(int row = 0; row < rowCount; row++)
  {    
    for(int column = 0; column < columnCount; column++)
    {
      colorMode(HSB, 100);
      array[row][column] = color(random(0,359), 16, 90);
    }
  }
}

// updateColor()
// Params: none
// Returns: none
// fill new color after time gone
void updateColor(color[][] array)
{
  int sizeW = width/columnCount;
  int sizeH = height/rowCount;        
  stroke(150);
  int posY = 0;  
  for(int row = 0; row < rowCount; row++)
  {
    int posX = 0;
    for(int column = 0; column < columnCount; column++)
    {
      fill(array[row][column]);
      rect(posX, posY, sizeW, sizeH);
      posX = posX + sizeW;
    }
    posY = posY + sizeH;
  }
}

//THIRD scene

// updateShape()
// Params: the number of row and column
// Returns: none
// draw the animation part of art, fill the ellipse in the window
void updateShape(int rowNumber, int columnNumber)
{
  background(#F5F4DC);
  int sizeW = width/columnNumber;
  int sizeH = height/rowNumber;
  ellipseMode(CORNER);
  stroke(150);
  int posY = 0;  
  for(int row = 0; row < rowNumber; row++)
  {
    int posX = 0;
    for(int column = 0; column < columnNumber; column++)
    {
      colorMode(HSB, 100);
      fill(random(0,359), 16, 90);
      ellipse(posX, posY, sizeW, sizeH);
      posX = posX + sizeW;
    }
    posY = posY + sizeH;
  }
}

//FOURTH scene

// fillTreeArray()
// Params: array of position x and position y
// Returns: none
// assign data to tree arrays
void fillTreeArray(int[] posX, int[] posY)
{
  int j = 150;
  for(int i = 0; i < posX.length; i++)
  {
    posX[i] = j;
    j = j + 250;
  }
  for(int i = 0; i < posY.length; i++)
  {
    posY[i] = 500;
  }
}
// fillTreeArray2()
// Params: array of position x and position y
// Returns: none
// assign data to tree arrays
void fillTreeArray2(int[] posX, int[] posY)
{
  int j = 150;
  for(int i = 0; i < posX.length; i++)
  {
    posX[i] = j;
    j = j + 250;
  }
  for(int i = 0; i < posY.length; i++)
  {
    posY[i] = 180;
  }
}

//drawTree()
// Params: array of position x and position y
// Returns: none
// draw trees
void drawTree(int[] posX, int[] posY)
{ 
  for(int i = 0; i < posX.length; i++)
  {
    
    strokeWeight(4);
    stroke(10);
    line(posX[i], posY[i], posX[i], height);
      
    ellipseMode(CENTER);
    noStroke();
    fill(#343C8E);
    ellipse(posX[i], posY[i], 150, 270);
  }    
}

//moveTree()
// Params: array of position x and speed of movement
// Returns: none
// move trees to left
void moveTree(int[] posX, int speed)
{
  for(int i = 0; i < posX.length; i++)
  {
    posX[i] -= speed;
    if(posX[i] < -150)
    {
      posX[i] = width;
    }
    else if(posX[i] > width)
    {
      posX[i] = -150;
    }
  }
}

//FIFTH scene

//drawCat()
// Params: none
// Returns: none
// draw the cat
void drawCat(int posX, int posY)
{

  fill(5);
  noStroke();
  ellipseMode(CENTER);
  ellipse(posX, posY, 60, 60);
  
  beginShape();
  vertex(posX-25, posY);
  vertex(posX-25-5, posY-55);
  vertex(posX, posY-25);
  vertex(posX+25+5, posY-55);
  vertex(posX+25, posY);
  endShape(CLOSE);
  
  beginShape();
  vertex(posX, posY+25);
  vertex(posX-25, posY+25+65);
  vertex(posX+25, posY+25+65);
  endShape(CLOSE);
  
  noFill();
  stroke(3);
  bezier(posX+20, posY+85, posX+75, posY+70, posX+85, posY-15, posX+35, posY-25);
}