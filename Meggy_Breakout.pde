#include <MeggyJrSimple.h>    

struct Point //creates struct for array
{
  int x;
  int y;
};

Point s1 = {2,0}; //setting initial coordinates for platform
Point s2 = {3,0};
Point s3 = {4,0};

Point platformArray[3] = {s1, s2, s3}; //declares platformArray

void setup()                    
{
  MeggyJrSimpleSetup();     
}

void loop()                  
{
  
}
