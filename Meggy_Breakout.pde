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
*/

struct Point //creates struct for array

{
  int x;
  int y;
};

Point s1 = {3,0}; //setting initial coordinates for platform
Point s2 = {4,0};
Point s3 = {5,0};

Point platformArray[3] = {s1, s2, s3}; //declares platformArray

void setup()                    
{
  MeggyJrSimpleSetup();     
}

void loop()                  
{
  drawPlatform(); //draws the platform
  buttonControls(); //checks buttons

  DisplaySlate();
  delay(100);
  ClearSlate();
}

void drawPlatform() //draws platform
  {
    for (int i = 0; i < 3; i++)
      {
        DrawPx(platformArray[i].x, 0, Green);
      }
  }   

void buttonControls()
  {
    CheckButtonsDown();
      if (Button_Right) //if Button_Right is pressed
          if (platformArray[2].x < 7) //if the x-coordinate in the last index < 7
              for (int i = 0; i < 3; i++)
                 platformArray[i].x++; //increase the x-coordinate
      
      if (Button_Left) //if Button_Left is pressed
          if (platformArray[0].x > 0)  //sets limits: if the x-coordinate in the last index > 0
              for (int i = 0; i < 3; i++)
                 platformArray[i].x--; //increase the x-coordinate
      
  }
