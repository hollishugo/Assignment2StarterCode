/*
    DIT OOP Assignment 2 Starter Code
    ==============================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

void setup()
{
  size(1280,1000);
  background(0);
  title = loadImage("title.png");
  single = loadImage("single.png");
  single1= loadImage("single1.png");
  multi = loadImage("multi.png");
  howto = loadImage("howto.png");
  background = loadImage("background.png");
  enemy = loadImage("enemy.png");
  enemy1 = loadImage("enemy1.png");
  p1 = loadImage("p1.png");
  p1punch = loadImage("p1punch.png");
  p1punchr = loadImage("p1punchr.png");
  p1r = loadImage("p1r.png");
  p1walk = loadImage("p1walk.png");
  p1walkr = loadImage("p1walkr.png");
  p2 = loadImage("p2.png");
  p2punchr = loadImage("p2punchr.png");
  p2r = loadImage("p2r.png");
  p2walk = loadImage("p2walk.png");
  p2walkr = loadImage("p2walkr.png");
  ball = loadImage("ball.png");
  toggledsingle = false;
  setUpPlayerControllers();
  lives=3;
  enemyX=random(width+1,width+100);
  enemyY=random(200,800);
  enemyX1=random(width+1,width+100);
  enemyY1=random(200,800);
}

PImage title;
PImage single;
PImage single1;
PImage multi;
PImage howto;
PImage background;
PImage enemy;
PImage enemy1;
PImage p1;
PImage p1punch;
PImage p1punchr;
PImage p1r;
PImage p1walk;
PImage p1walkr;
PImage p2;
PImage p2punchr;
PImage p2r;
PImage p2walk;
PImage p2walkr;
PImage ball;
int lives;
boolean toggledsingle;
float enemyX; 
float enemyY;
float enemyX1; 
float enemyY1;
int i;
int score;


void draw()
{
  //menu
   image(title,20,0,width,height/3);
   image(single,width/4.5,height/2.7);
   image(multi,width/3.5,height/1.8);
   image(howto,width/22,height/1.3);
   
   //single option
   if(mouseX>width/4.3 && mouseY>height/2.8 && mouseX<width/1.35 && mouseY<height/2.1)
   {
     image(single1,width/4.5,height/2.7);
   }
   

  
  //single player game
  if(toggledsingle)
  {
    background(background);
    textSize(32);
    text("Score "+score,width/12,height/12);
    text("lives "+lives,width/12,height/9);
    for(i=0;i<10;i++)
    {
      image(enemy,enemyX,enemyY,100,100);
      image(enemy,enemyX1,enemyY1,100,100);
      enemyX -= .3;
      enemyX1 -= .3;
      if(enemyX <= -100)
      {
        lives -= 1;
        enemyX=random(width+1,width+100);
        enemyY=random(200,800);
      }
       if(enemyX1 <= -100)
      {
        lives -= 1;
        enemyX1=random(width+1,width+100);
        enemyY1=random(200,800);
      }
    }
    for(Player player:players)
    {
      player.update();
      player.display();
    }
  
  }
  
  
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = 300;
   players.add(p);         
  }
}

void mousePressed()
{
  if(mouseX>width/4.3 && mouseY>height/2.8 && mouseX<width/1.35 && mouseY<height/2.1)
  {
    toggledsingle=!toggledsingle;
  }
}
