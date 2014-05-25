{\rtf1\ansi\ansicpg1252\cocoartf1187\cocoasubrtf400
{\fonttbl\f0\fswiss\fcharset0 ArialMT;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\ri720

\f0\fs24 \cf0 Meggy Breakout\
\
Meggy Breakout is a version of Atari Breakout. Meggy Breakout is played on  an 8x8 screen, with bright colors and sound effects. You move a red paddle back and forth and attempt to bounce the bright blue ball around the screen, knocking out purple blocks to clear the screen. Do it. It is fun. \
\uc0\u8232 Part II: In a concise, thoughtful reflection, please address the following prompts:
\f1 \
\pard\tx720\tx1440\pardeftab720\ri720
\cf0 \
	
\f0 During the MeggyJr final project, the hardest part of my project was doing the collision detection for the blocks. I understood the concept of what I needed to do, however I had a hard time writing code that would make it work. The problem was whenever it read the the ball was going to hit the block, the block would be colored over in black using a for loop in an if statement, but when the ball changed direction and bounced away, the loop would read it as "false" as change back to its original color. I eventually found that instead of coloring it over again in black, I would just change the color of the blocks to black. Something I found surprising was how quickly things could become very confusing while you edited code. I use LabVIEW for robotics (visual programming language), but this class was the first time I've written in a text-based language. Things like remembering to add semi-colons to the end of lines, indenting properly, knowing the words for specific functions, etc. was really hard for me to get used to even after the assignments leading up to the project.\
\pard\tx720\pardeftab720\ri720

\f1\b \cf0 	
\f0\b0 Referencing what I mentioned above, I tended to forget small details a lot, so having my classmates quickly look over a section of code or play the game really helped improve my skills and definitely made it easier to continue with the project. During the beta-testing process, I got a lot of useful comments about how I could improve the game and information about problems I didn't even know I had. Another collaboration that was extremely beneficial to helping me build my game and understand the program more in general was working with Mr. Kiang. After class, using the "Screen Hero" application, I was able to ask for help from Mr. Kiang. Having someone look over your code and give his or her thoughts and advice is really useful, whether it be by a classmate or a teacher. The importance of being able to collaborate and learn through troubleshooting was emphasized a lot especially in this class.\

\f1\b 	
\f0\b0 The biggest bug that I have in game is that the ball can phase through some of the blocks. For example, if the ball goes into a space from a block that was taken out and bounces off the block/wall above it, it might phase through the block to the left of the space. I noticed this during the coding process and think I understand why it is happening. The collision detection for the blocks reads the direction the ball is coming in from and changes the direction of the blocks accordingly using a series of if statements. When the ball comes in from a direction that isn't stated, it will just pass through it with no problem. I've tried to fix this by adding an if statement for directions coming off behind the block, but when I tried it, the block would get stuck between the blocks at the top, move to the left/right taking out all the blocks in the process. This is due to the fact that I have a limited amount of directions. I would be able to solve this problem if I have more directions for the ball to bounce off of, but if it stays at the same slope it will just continue to break blocks.
\f1\b \
\pard\tx720\pardeftab720\ri720

\b0 \cf0 	
\f0 I think right now, because the collision detection problem among several others really made it hard to debug and finish the game, the game is dull and can be improved on a lot. I said in the beginning of the project, how I wanted to add increasing more difficult levels, a scoring system, and "power ups" like when you hit a certain block, your paddle gets longer, or the ball moves slower, or gain lives. After reading through the feedback, the main things I would add would be a scoring system and increasingly more difficult levels. This would give the game more appeal by adding challenge and a score a person could compete with. Non-game related things I would change to improve the game would to add more directions to make the game more interesting and a random generator to randomly determine the direction of the ball when it hits a corner. This wouldn't be hard to add, but I never realized until we did the beta testing that the ball sometimes gets stuck in the same path when it hits the corners. I also got a comment about adding a button to easily restart the game instead of just turning the Meggy off and on again. I thought this was a really great idea, because I know how much I hate it when I have to restart the whole system just to replay a level.
\f1\b \
\pard\tx220\tx720\pardeftab720\ri720
\cf0 		
\f0\b0 I think this game taught me a lot about troubleshooting, emphasized the importance of commenting code, and essential how useful it can be to have people help you along the way. These skills: problem solving, clarity, and importance of being able to ask for help, can be translated to life lessons. I think I've touched on all of these skills somewhere in this reflection/ReadMe, but this game really was a fun and interesting challenge. A lot of the work and problem solving was going to need to come from whatever we could find on Google or the Meggy Programming Guide, past knowledge, and what our classmates knew. A lot of the game design aspects, were taken from what we learned in first semester, like difficulty progression, replay ability, and interactivity. We also learned a lot from just beta-testing. For me, the feedback was extremely helpful. After playing my game for what seemed like an hour, getting a new perspective was crucial to improving.\
\pard\pardeftab720\ri720

\f1 \cf0 \
}