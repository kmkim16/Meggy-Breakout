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

Point platformArray[4] = {p1, p2, p3, c4}; //declares platformArray -- platformArray[2] is right, platform[1] is middle, platform[0] is left
Block blockArray[12] = {a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12}; //declares blockArray 

int direction = 1; //directions 1 = neutral, 0 = up, 45 = top rt diag, 135 = btm rt diag, 180 = down, 225 = left btm diag, 315 = left top diag
boolean gameStart = false; //boolean for after the player presses 'A' to start the game
boolean blockHit = true;
boolean endGame = false;
boolean ballBounce = false;
int marker = 12;
int counter = 0;

void setup()                    
{
  MeggyJrSimpleSetup();   
  Serial.begin(9600);
  DisplaySlate();

}
void loop()                  
{
  counter++;
  if (counter > 100)
    counter = 0;
    
  CheckButtonsPress();
    if (!gameStart)
      if (Button_A)
        {
          direction = 45;
          gameStart = true;
        }
    if (counter % 2 == 0)
    {
      ballDirection();
    }
  
  ClearSlate();
  drawPlatform(); //draws the platform
  buttonControls(); //checks buttons
  drawBlock(); //draws blocks
  centerBall(); //keeps ball in center of paddle, before game starts
  edgeLimits();
  //ballDirection(); //controls angle ball bounces at
  blockCollision(); //checks to see if ball hits blocks
  platformCollision();
  loseGame();


  DisplaySlate();
  delay(100);
}

void drawPlatform() //draws platform and ball
  {
    for (int i = 0; i < 3; i++)
      {
        DrawPx(platformArray[i].x, platformArray[i].y, Green); //draws platform
        DrawPx(platformArray[3].x, platformArray[3].y, Blue); //draws ball
      }
  }   

void buttonControls()

  {
    CheckButtonsDown();
      if (Button_Right) //if Button_Right is pressed
      {    
          if (platformArray[2].x < 7)//if the x-coordinate in the last index < 7
              for (int i = 0; i < 3; i++)
                 platformArray[i].x++; //increase the x-coordinate
      }
      if (Button_Left) //if Button_Left is pressed
      {
          if (platformArray[0].x > 0) //sets limits: if the x-coordinate in the last index > 0
              for (int i = 0; i < 3; i++)
                 platformArray[i].x--; //decrease the x-coordinate
      }
      if (Button_B)
      {
        Serial.print("X");
        Serial.print(platformArray[0].x);
       Serial.print("Y");
        Serial.print(platformArray[0].y);
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
  if (blockHit)  
    {
    for (int i = 0; i < 12; i++)
          { 
            DrawPx(blockArray[i].x, blockArray[i].y, blockArray[i].color);
            DrawPx(blockArray[i].x+1, blockArray[i].y, blockArray[i].color);
          }
      }
}

void blockCollision() //detects when ball hits blocks and makes them disappear
  {
    for (int i = 0; i < marker; i++)
     {
      if (platformArray[3].y == blockArray[i].y && platformArray[3].x == blockArray[i].x && blockArray[i].color != 0 
      || platformArray[3].y == blockArray[i].y && platformArray[3].x == blockArray[i].x+1 && blockArray[i].color != 0)
        {
        if (direction == 0)
          {
            blockArray[i].color = 0;
            direction = 180;
          }
          
        if (direction == 45)
          {
            blockArray[i].color = 0;
            direction = 135;
          }
          
          if (direction == 315)
          {
            blockArray[i].color = 0;
            direction = 225;
          }
        }
     }
  }
       /*
      else
        {
          DrawPx(blockArray[marker].x, blockArray[marker].y, blockArray[marker].color);
          DrawPx(blockArray[marker].x+1, blockArray[marker].y, blockArray[marker].color);
        }
          }*/
  
      
void platformCollision()
  {      
      if (platformArray[3].x == platformArray[2].x && platformArray[3].y == platformArray[2].y+1)
        {
          if (gameStart)
            {
              if (direction == 180)
                direction = 45;
              if (direction == 135)
                direction = 45;
              if (direction == 225)
                direction = 45;
            }
        }
        
      if (gameStart)
        {
        if (platformArray[3].x == platformArray[1].x && platformArray[3].y == platformArray[1].y+1)
            {
              if (direction == 180)
                direction = 0;
              if (direction == 135)
                direction = 45;
              if (direction == 225)
                direction = 315;
            }
        }
        
      if (platformArray[3].x == platformArray[0].x && platformArray[3].y == platformArray[0].y+1)
        {
          if (gameStart)
            {
              if (direction == 180)
                direction = 315;
              if (direction == 135)
                direction = 315;
              if (direction == 225)
                direction = 315;
            }
        }
  }

void ballDirection()
  { 
    if (direction == 0) //if direction is up, increase y-coord of ball
     { 
      platformArray[3].y++;
      Serial.print("Y");
     }
    
    if (direction == 45) //if left diagnol bounce, increase x-coord and decrease y-coord
      {
        platformArray[3].x++;
        platformArray[3].y++;
      }    
     
    if (direction == 135)
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
    
    if (direction == 315)
      {
        platformArray[3].x--;
        platformArray[3].y++;
      }
  }
  
void edgeLimits()
  {
    if (platformArray[3].y > 6) //adjusting limits at the top of screen
      {
        if (direction == 0)
          direction = 180;
        if (direction == 45)
          direction = 135;
        if (direction == 315)
          direction = 225;
      }
     
    if (platformArray[3].x < 1)
      {  
        if (direction == 315)
          direction = 45;
        if (direction == 225)
          direction = 135;
      }
    
    if (platformArray[3].x > 6)
      {
        if (direction == 45)
          direction = 315;
        if (direction == 135)
          direction = 225;
      }
  
/*    if (platformArray[3].y < 2) //temporarily will have the ball bounce back up if it is row 1
      {
        if (gameStart == true)
          {
            platformArray[3].y = 1;
            direction = 0;
          }
      }
      if (platformArray[3].x == platformArray[2].x && platformArray[3].y == platformArray[2].y+1)
        {
          if (gameStart)
            {
              if (direction == 180)
                direction = 45;
              if (direction == 135)
                direction = 45;
              if (direction == 225)
                direction = 45;
            }
        }
        
      if (gameStart)
        {
        if (platformArray[3].x == platformArray[1].x && platformArray[3].y == platformArray[1].y+1)
            {
              if (direction == 180)
                direction = 0;
              if (direction == 135)
                direction = 45;
              if (direction == 225)
                direction = 315;
            }
        }
        
      if (platformArray[3].x == platformArray[0].x && platformArray[3].y == platformArray[0].y+1)
        {
          if (gameStart)
            {
              if (direction == 180)
                direction = 315;
              if (direction == 135)
                direction = 315;
              if (direction == 225)
                direction = 315;
            }*/
        }

void loseGame()
  {
    if (platformArray[3].y < 1)
      {
         direction = 1;
         endGame = true;
       }
   
    for(int i = 7; i > 0; i--)
      {
        if (endGame)
          {
            for(int x = 0; x < 8; x++)
              {
                for(int y = 0; y < 8; y++)
                  {
                    DrawPx(x, y, Red);
                  }
               }
            }
        }
  }
      
