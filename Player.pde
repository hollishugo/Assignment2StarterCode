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
      pos.y -= 2;
    }
    if (checkKey(down) && pos.y < height-315)
    {
      pos.y += 2;
    }
    if (checkKey(left) && pos.x > -10)
    {
      pos.x -= 2;
    }    
    if (checkKey(right) && pos.x <width-200)
    {
      pos.x += 2;
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
      image(p1punchr,pos.x, pos.y, 260, 200);
      if(dist(pos.x,pos.y,enemyX,enemyY)<=width/5)
      {
        enemyX=random(width+1,width+100);
        enemyY=random(200,800);
        score += 1;
      }
      if(dist(pos.x,pos.y,enemyX1,enemyY1)<=width/5)
      {
        enemyX1=random(width+1,width+100);
        enemyY1=random(200,800);
        score += 1;
        
      }
    }
    if (checkKey(button2))
    {
      image(ball,pos.x,pos.y,50,50);
    }
  }  
}
