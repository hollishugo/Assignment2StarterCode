class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;
    
  Player()
  {
    pos = new PVector(width / 2, height / 2);
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    if (checkKey(up) && pos.y > 100)
    {
      pos.y -= 1;
    }
    if (checkKey(down) && pos.y < height-315)
    {
      pos.y += 1;
    }
    if (checkKey(left) && pos.x > -10)
    {
      pos.x -= 1;
    }    
    if (checkKey(right) && pos.x <width-200)
    {
      pos.x += 1;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    }    
  }
  void display()
  { //button to start game
    if(!toggledsingle)
    { 
      if (checkKey(button1))
      {
        toggledsingle=!toggledsingle;
      }
    }  
    //controls for player and effects on enemies
    if(toggledsingle)
    {  
      image(p1r,pos.x, pos.y, 200, 200);
      if (checkKey(up))
      {
        image(p1walkr,pos.x, pos.y, 200, 200); 
      }
      if (checkKey(down))
      {
        image(p1walkr,pos.x, pos.y, 200, 200);
      }
      if (checkKey(right))
      {
        image(p1walkr,pos.x, pos.y, 200, 200);
      }
      if (checkKey(button1))
      {
        fistX=pos.x+100;
        fistY=pos.y+50;
        image(p1punchr,pos.x, pos.y, 260, 200);
        punch.play();
        if(dist(fistX,fistY,enemyX,enemyY)<=width/9)
        {
          for(i=0;i<40;i++)
          {
            image(enemy,enemyX,enemyY,100,100);
            enemyX +=20;
            enemyY -=20;
          }
          enemyX=random(width+1,width+100);
          enemyY=random(200,800);
          score += 1;
        }
        if(dist(fistX,fistY,enemyX1,enemyY1)<=width/9)
        {
          for(i=0;i<40;i++)
          {
            image(enemy,enemyX1,enemyY1,100,100);
            enemyX1 +=20;
            enemyY1 -=20;
          }
          enemyX1=random(width+1,width+100);
          enemyY1=random(200,800);
          score += 1;
        
        }
        if(dist(fistX,fistY,enemyX2,enemyY2)<=width/9)
        {
          for(i=0;i<40;i++)
          {
            image(enemy,enemyX2,enemyY2,100,100);
            enemyX2 +=20;
            enemyY2 -=20;
          }
          enemyX2=random(width+1,width+100);
          enemyY2=random(200,800);
          score += 1;
        }
        if(dist(fistX,fistY,enemyX3,enemyY3)<=width/9)
        {
          for(i=0;i<40;i++)
          {
            image(enemy,enemyX3,enemyY3,100,100);
            enemyX3 +=20;
            enemyY3 -=20;
          }
          enemyX3=random(width+1,width+100);
          enemyY3=random(200,800);
          score += 1;
        }
        if(dist(fistX,fistY,eliteX,eliteY)<=width/9)
        {
          ehealth-=1;
          if(ehealth <= 0)
          {
            eliteX=random(width+300,width+1000);
            eliteY=random(200,700);
          }
        }
      }
      if (checkKey(button2))
      {
        image(p1punchr,pos.x, pos.y, 260, 200);
        ballX=pos.x;
        ballY=pos.y;
        for(i=0;i<8;i++)
        {
          image(ball,ballX+260,ballY+60,100,100);
          ballX += 80;
        }
         if(dist(ballX,ballY,enemyX1,enemyY1)<=width/6)
         for(i=0;i<10;i++)
         {
           enemyX1 +=.3;
           enemyY1 +=.3;
         }
         if(dist(ballX,ballY,enemyX,enemyY)<=width/6)
         for(i=0;i<10;i++)
         {
           enemyX +=.3;
           enemyY +=.3;
         }
         if(dist(ballX,ballY,enemyX2,enemyY2)<=width/6)
         for(i=0;i<10;i++)
         {
           enemyX2 +=.3;
           enemyY2 +=.3;
         }
         if(dist(ballX,ballY,enemyX3,enemyY3)<=width/6)
         for(i=0;i<10;i++)
         {
           enemyX3 +=.3;
           enemyY3 +=.3;
         }
      }
     }
    }  
  }
