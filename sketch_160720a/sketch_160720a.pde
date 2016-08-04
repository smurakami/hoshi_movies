ArrayList ball = new ArrayList();
PImage img;

void setup(){
  size(960,960);
  background(255,255,255);
  smooth();
  noStroke();
  img = loadImage("hoshi_ball.png");
}

void draw(){
  fill(255,255,255);
  noStroke();
  rect(0,0,width,height);
  stroke(0,134,205);
  strokeWeight(3);
  //line(0,width/12,width/6,width/12);
  //line(width*1/6,width*1/12,width*1/6,width*3/12);
  for(int j = 0 ; j < 6; j=j+1){
    line(width/6*j,width/12*(2*j+1),width/6*(j+1),width/12*(2*j+1));
    if(j!=5){
      line(width/6*(j+1),width/12*(2*j+1),width/6*(j+1),width/12*(2*j+3));
    }
  }
  for(int i = 0 ; i < ball.size(); i++){
    Ball b = (Ball)ball.get(i);
    b.draw();
  }
  //saveFrame("frames/######.png");
}

void mousePressed(){
  ball.add(new Ball());
}

class Ball{
  
  float x = mouseX;
  float y = mouseY-100-(int)random(0,200);
  
  float speedX = 4+(int)random(0,6);
  float speedY = 3+(int)random(0,6);
  
  int r = 0;
  int g = 0;
  int b = 0;

  float gravity = 1;
  float friction = 0.999;
  
  void draw(){
    fill(r,g,b);
    image(img, x, y , 68, 68);

    
    speedX *= friction;
    speedY *= friction;
    speedY += gravity;
    
    x += speedX;
    y += speedY;
    
  for(int j = 0 ; j < 6; j++){
    if(x > width/6*j && x <= width/6*(j+1) && y > width/12*(2*j+1)-68){
      y = width/12*(2*j+1)-68;
      speedY *= -0.9;
    }    
  }
    
    if(x < 0){
      speedX *= -0.9;
    }
  }
}
