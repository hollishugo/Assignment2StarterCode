/*
    DIT OOP Assignment 2 Starter Code
    ==============================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];
import ddf.minim.*;
AudioPlayer theme, punch;
Minim minim;
//setup to load images and set values
void setup()
{
  size(1280,1000);
  background(0);
  title = loadImage("title.png");
  single = loadImage("single.png");
  background = loadImage("background.png");
  enemy = loadImage("enemy.png");
  p1punchr = loadImage("p1punchr.png");
  p1r = loadImage("p1r.png");
  p1walkr = loadImage("p1walkr.png");
  elite = loadImage("p2.png");
  p2walk = loadImage("p2walk.png");
  ball = loadImage("ball.png");
  over = loadImage("over.png");
  toggledsingle = false;
  toggledover = false;
  setUpPlayerControllers();
  lives=3;
  enemyX=random(width+1,width+100);
  enemyY=random(200,800);
  enemyX1=random(width+1,width+100);
  enemyY1=random(200,800);
  enemyX2=random(width+1,width+100);
  enemyY2=random(200,800);
  enemyX3=random(width+1,width+100);
  enemyY3=random(200,800);
  eliteX=random(width+100,width+1000);
  eliteY=random(200,700);
  minim=new Minim(this);
  theme=minim.loadFile("theme.mp3");
  punch=minim.loadFile("punch.mp3");
  theme.loop();
  ehealth=30;
}
//declaring variables
PImage enemy;
PImage title;
PImage single;
PImage background;
PImage p1punchr;
PImage p1r;
PImage p1walkr;
PImage elite;
PImage p2walk;
PImage ball;
PImage over;
int lives;
int time;
boolean toggledsingle;
boolean toggledover;
float enemyX; 
float enemyY;
float enemyX1; 
float enemyY1;
float enemyX2; 
float enemyY2;
float enemyX3; 
float enemyY3;
float eliteX;
float eliteY;
int ehealth;
int i;
int score;
float ballX;
float ballY;
float fistX;
float fistY;



void draw()
{
     //menu
    for(Player player:players)
    {
      player.update();
      player.display();
    }
   image(title,50,0,width,height/3);
   image(single,width/4.5,height/2.7);
   textSize(32);
   text("  You are an elite fighter tasked with preventing the enemy from",100,500);
   text("     crossing the bridge into your home castle. For every enemy ",100,550);  
   text("          you stop a member of your castle can be evacuated.",100,600);
   text("    How many can you save before the castle is overwhelmed?",100,650); 
   text("Button 1 to punch and kill enemies",340,800);
   text("Button 2 to use your powers to slow them down and force them downwards",55,850);
  //game
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
      image(enemy,enemyX2,enemyY2,100,100);
      image(enemy,enemyX3,enemyY3,100,100);
      image(elite,eliteX,eliteY,200,200);
      enemyX -= .3;
      enemyX1 -= .3;
      enemyX2 -= .3;
      enemyX3 -= .3;
      eliteX -= .3;
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
      if(enemyX2 <= -100)
      {
        lives -= 1;
        enemyX2=random(width+1,width+100);
        enemyY2=random(200,800);
      }
      if(enemyX3 <= -100)
      {
        lives -= 1;
        enemyX3=random(width+1,width+100);
        enemyY3=random(200,800);
      }
      if(eliteX <=-100)
      {
        eliteX=random(width+300,width+1800);
        eliteY=random(200,700);
        lives -= 1;
      }
    }
    for(Player player:players)
    {
      player.update();
      player.display();
    }
    //game over screen
    if(lives<=0)
    {
      background(0);
      image(over,100,100,1100,400);
      
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

