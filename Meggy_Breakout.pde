#include <MeggyJrSimple.h>    
/*
Draw platform
Draw Ball
DrawBlocks
delay & ClearSlate
CheckButtons
Update Position based on buttons
Check limits
Check to make sure ball is not in row position 0
Collision Detection with Blocks
Wall 45-degree angle thing
Check End of Level

Add direction variables to keep the ball moving?
*/

struct Point //creates struct for array

{
  int x;
  int y;
};

Point p1 = {3,0}; //setting initial coordinates for platform
Point p2 = {4,0};
Point p3 = {5,0};
Point c4 = {4,1}; //setting initial ball coordinates
Point b1 = {2,5};
Point b2 = {3,5};
Point b3 = {4,5};

Point platformArray[3] = {p1, p2, p3}; //declares platformArray
Point blockArray[3] = {b1, b2, b3}; //declares blockArray

int direction = 1;

void setup()                    
{
  MeggyJrSimpleSetup();   
}

void loop()                  
{
  ClearSlate();
  drawPlatform(); //draws the platform
  buttonControls(); //checks buttons
  centerBall();
  ballDirection();
  blockA();

  DisplaySlate();
  delay(100);
  blockA();  
}

void drawPlatform() //draws platform
  {
    for (int i = 0; i < 3; i++)
      {
        DrawPx(platformArray[i].x, platformArray[i].y, Green);
      }
  }   

void buttonControls()
  {
    CheckButtonsDown();
      if (Button_Right) //if Button_Right is pressed
          if (platformArray[2].x < 7)//if the x-coordinate in the last index < 7
              for (int i = 0; i < 3; i++)
                 platformArray[i].x++; //increase the x-coordinate
      
      if (Button_Left) //if Button_Left is pressed
          if (platformArray[0].x > 0 && platformArray[3].x > 0) //sets limits: if the x-coordinate in the last index > 0
              for (int i = 0; i < 3; i++)
                 platformArray[i].x--; //decrease the x-coordinate
                 
      if (Button_A)
        {
          direction = 0;
        }
        
  }             
                 
void centerBall() //centers the position of the ball to be in the center of the platform
  {
    DrawPx(platformArray[1].x, platformArray[1].y+1, Blue);
    
    if (platformArray[3].y == 1) //only centers ball if 
      if (platformArray[3].x != platformArray[1].x)
        {
          platformArray[3].x = platformArray[1].x;   
        }
  }

void blockA()
  {
    /*if (ReadPx(platformArray[3].x, platformArray[3].y) == 1)
      for (int i = 0; i < 3; i++)
       { 
        DrawPx(blockArray[i].x, blockArray[i].y, 0);
       }
      
    if (ReadPx(platformArray[3].x, platformArray[3].y) != 1)
      for (int i = 0; i < 3; i++)
       { 
        DrawPx(blockArray[i].x, blockArray[i].y, Red);
       }*/
   
    for (int i = 0; i < 3; i++)
      {
      DrawPx(blockArray[i].x, blockArray[i].y, Red);
      }
  }

void ballDirection()
  {
    if (direction == 0)
      platformArray[3].y++;
      
    if (direction == 1)
      platformArray[3].y;

    if (platformArray[3].y > 7) //adjusting limits
      platformArray[3].y = 7;

}
      
     
