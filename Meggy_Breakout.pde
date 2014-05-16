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
//create struct for each block
struct Point //creates struct for array
{
  int x;
  int y;
};

struct Block
{
  int x;
  int y;
  int color;
};

Point p1 = {3,0}; //setting initial coordinates for platform
Point p2 = {4,0};
Point p3 = {5,0};
Point c4 = {4,1}; //setting initial ball coordinates

Block a1 = {0,7,3}; //top row blocks are a1=a4
Block a2 = {2,7,2};
Block a3 = {4,7,5};
Block a4 = {6,7,1};
Block a5 = {0,6,4}; //second row blocks are a5-a6
Block a6 = {2,6,6};
Block a7 = {4,6,7};
Block a8 = {6,6,8};
Block a9 = {0,5,9}; //third row blocks are a7-a12
Block a10 = {2,5,10};
Block a11 = {4,5,1};
Block a12 = {6,5,12};

Point platformArray[4] = {p1, p2, p3, c4}; //declares platformArray
Block blockArray[12] = {a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12}; //declares blockArray

int direction = 1; //directions 1 = neutral, 0 = up, 45 = top rt diag, 135 = btm rt diag, 180 = down, 225 = left btm diag, 315 = left top diag
boolean gameStart = false; //boolean for after the player presses 'A' to start the game
boolean deleteBlock = false;
//int marker = 0; //marker to cycle through blocks

void setup()                    
{
  MeggyJrSimpleSetup();   
}

void loop()                  
{
  ClearSlate();
  drawPlatform(); //draws the platform
  buttonControls(); //checks buttons
  drawBlock(); //draws blocks
  centerBall(); //keeps ball in center of paddle, before game starts
  ballDirection(); //controls angle ball bounces at
  blockCollision(); //checks to see if ball hits blocks

  DisplaySlate();
  delay(100);
}

void drawPlatform() //draws platform and ball
  {
    for (int i = 0; i < 4; i++)
      {
        DrawPx(platformArray[i].x, platformArray[i].y, Green); //draws platform
        DrawPx(platformArray[3].x, platformArray[3].y, Blue); //draws ball
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
          if (platformArray[0].x > 0) //sets limits: if the x-coordinate in the last index > 0
              for (int i = 0; i < 3; i++)
                 platformArray[i].x--; //decrease the x-coordinate
                 
      if (Button_A) //sets direction to up and starts game
        {
          direction = 0;
          gameStart = true;
        }
  }             
                 
void centerBall() //centers the position of the ball to be in the center of the platform
  {
    if (!gameStart) //only centers ball if game has not been started
      if (platformArray[3].y == 1)
        if (platformArray[3].x != platformArray[1].x)
          {
            platformArray[3].x = platformArray[1].x;   
          } 
  }

void drawBlock() //draws blocks in blockArray
  {
    for (int i = 0; i < 12; i++)
      {
        DrawPx(blockArray[i].x, blockArray[i].y, blockArray[i].color);
        DrawPx(blockArray[i].x+1, blockArray[i].y, blockArray[i].color);
      }
  }

void blockCollision() //detects when ball hits blocks and makes them disappear
  {
    for (int i = 0; i < 12; i++) 
     { 
      if (platformArray[3].y == blockArray[i].y && platformArray[3].x == blockArray[i].x || platformArray[3].y == blockArray[i].y && platformArray[3].x == blockArray[i].x+1)
        {
          deleteBlock = true;
          direction = 180;
        }
        
      if (deleteBlock) //when the ball collides with a block, deleteBlock makes them disappear by drawing over in black
         { 
          DrawPx(blockArray[i].x, blockArray[i].y, 0);
          DrawPx(blockArray[i].x+1, blockArray[i].y, 0);
         }
     }
}


void ballDirection()
  {
    if (direction == 0) //if direction is up, increase y-coord of ball
      platformArray[3].y++;
      
    if (direction == 45) //if left diagnol bounce, increase x-coord and decrease y-coord
      {
        platformArray[3].x++;
        platformArray[3].y++; 
      }    
      
    if (direction = 135)
      {
        platformArray[3].x++;
        platformArray[3].y--;
      }
      
    if (direction == 180) //if the direction is down, decrease y-coord of ball
      platformArray[3].y--;
    
    if (direction == 225) //if left diagnol bounce, decrease x-coord and increase y-coord
      {
        platformArray[3].x--;
        platformArray[3].y--;
      }
    
    if (direction = 315)
      {
        platformArray[3].x--;
        platformArray[3].y++;
      }
    
      
    if (platformArray[3].y > 7) //adjusting limits at the top of screen
      if (direction ==
      {
      platformArray[3].y = 7;
      direction = 180;
      }

    if (platformArray[3].y < 2) //temporarily will have the ball bounce back up if it is row 1
      if (gameStart == true)
        {
          platformArray[3].y = 1;
          direction = 0;
        }

  }
