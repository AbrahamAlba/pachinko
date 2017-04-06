import ddf.minim.*;
import processing.video.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Movie test;

Minim minim;
AudioPlayer intro;
AudioPlayer enter;
AudioPlayer beep;
AudioPlayer selectm;
AudioPlayer arrow;

PImage gameui;
PImage lock;
PImage bbpreview;
PImage startbutton;
PImage select;
PImage bg2;
PImage introbg;
PImage gradient;
PImage esf;
PImage pachinkojp;
PImage ginga;
PImage pachgal;
PImage lf;
PImage of;
PImage pressstart;

PGraphics esf1;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;

float score;
int g1=0;
int m3=0;
int m2=0;
int m1=0;
int pantalla=0;
int a=0;
float b;
float b2;
float c=0;
float t;
float t2;
float t3;
float t4;
float r;
float x;
float y;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;
float x5;
float y5;
float x6;
float y6;
float x7;
float y7;
float x8;
float y8;
float x9;
float y9;
float z;

void setup(){
  bluresfera();
  walls();

size(900,900);
smooth();
stroke(255);

box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, 25);
  
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

gameui = loadImage("gameui.png");
bbpreview = loadImage("bbpreview.jpg");
select = loadImage("choosesong.png");
startbutton = loadImage("start.png");
bg2 = loadImage("bg2.jpg");
introbg = loadImage("spacebg.jpg");
gradient = loadImage("gradient.png");
pachinkojp = loadImage("pachinko_jp.png");
ginga = loadImage("ginga.png");
pachgal = loadImage("pachinko_galaxy.png");
lf = loadImage("lensflare.jpg");
of = loadImage("opticalflare.png");
pressstart = loadImage("press_enter.png");
lock = loadImage("locked.png");
imageMode(CENTER);

minim = new Minim(this);
  intro = minim.loadFile("ApoLLo_2XXX.mp3");
  enter = minim.loadFile("decision26.mp3");
  beep = minim.loadFile("beep.mp3");
  selectm = minim.loadFile("musicselect.mp3");
  arrow = minim.loadFile("cursor4.mp3");
  
test = new Movie(this, "test1.mov");

/*if(g1==1){
boundaries.add(new Boundary(width/2,(height-5),width,10));

  boundaries.add(new Boundary(width/2-25,650,width-350,10));
  boundaries.add(new Boundary(width/2-25,550,width-350,10));
  boundaries.add(new Boundary(width/2-25,450,width-350,10));
  boundaries.add(new Boundary(width/2-25,350,width-350,10));
  boundaries.add(new Boundary(width/2-25,250,width-350,10));
  
  boundaries.add(new Boundary(width/2+25,700,width-350,10));
  boundaries.add(new Boundary(width/2+25,600,width-350,10));
  boundaries.add(new Boundary(width/2+25,500,width-350,10));
  boundaries.add(new Boundary(width/2+25,400,width-350,10));
  boundaries.add(new Boundary(width/2+25,300,width-350,10));
  boundaries.add(new Boundary(width/2+25,200,width-350,10));
  
  boundaries.add(new Boundary(150,height/2,10,height));
  boundaries.add(new Boundary(750,height/2,10,height));
}
*/
}

void draw(){
inicio();
menu();
juego();
}

void fondo(){
  if(pantalla==0){
  intro.play();
  r=r+0.002;
  pushMatrix();
    tint(255);
    image(introbg,width/2,height/2);
    translate(width/2, height/2);
    rotate(r);
    image(introbg, 0, 0);
  popMatrix();
  
  image(gradient,width/2,height/2);
  }
}

void esfera(){
  if(pantalla==0){
  fill(255);
  //Esfera1
  pushMatrix();
    x=(x+3);
    y=(y+1.55);
    image(esf1,0+x,78+y);
    ellipse(0+x,78+y,10,10);
  popMatrix();
  
  //Esfera2
  pushMatrix();
    x2=x2+10;
    y2=y2+2.466;
    image(esf1,0+x2,338-y2);
    ellipse(0+x2,338-y2,10,10);
     if(x2>width){
      x2=-10;
      y2=-2.466;
    }
  popMatrix();
  
  //Esfera3
  pushMatrix();
    x3=x3+5.454;
    y3=y3-1.096;
    image(esf1,0+x3,445-y3);
    ellipse(0+x3,445-y3,10,10);
     if(x3>width){
      x3=-5.454;
      y3=1.096;
    }
  popMatrix();
  
  //Esfera4
  pushMatrix();
    x4=x4+5;
    y4=y4-2.016;
    image(esf1,0+x4,489+y4);
    ellipse(0+x4,489+y4,10,10);
     if(x4>width){
      x4=-5;
      y4=2.016;
    }
  popMatrix();
  
  //Esfera5
  
  pushMatrix();
    x5=x5+8.571;
    y5=y5+0.9809;
    image(esf1,0+x5,539+y5);
    ellipse(0+x5,539+y5,10,10);
     if(x5>width){
      x5=-8.571;
      y5=-0.9809;
    }
  popMatrix();
  
  //Esfera6
  pushMatrix();
    x6=x6+4;
    y6=y6+2.32;
    image(esf1,0+x6,652-y6);
    ellipse(0+x6,652-y6,10,10);
     if(x6>width){
      x6=-4;
      y6=-2.32;
    }
  popMatrix();
  
  //Esfera7
  pushMatrix();
    x7=x7+7.5;
    y7=y7+1.8583;
    image(esf1,0+x7,900-y7);
    ellipse(0+x7,900-y7,10,10);
     if(x7>width){
      x7=-7.5;
      y7=-1.8583;
    }
  popMatrix();
  
  //Esfera8
  pushMatrix();
    x8=x8+2.3925;
    y8=y8+3.333;
    image(esf1,146+x8,900-y8);
    ellipse(146+x8,900-y8,10,10);
     if(y8>height){
      x8=-2.3925;
      y8=-3.333;
    }
  popMatrix();
  
  //Esfera9
  pushMatrix();
    x9=x9+1.666666;
    y9=y9-2.8;
    image(esf1,800+x9,900+y9);
    ellipse(800+x9,900+y9,10,10);
     if(x9>110){
      x9=-1.666;
      y9=2.8;
    }
  popMatrix();
  }
}

void bluresfera(){
  if(pantalla==0){
esf1 = createGraphics(50,50);  
  esf1.beginDraw();
    esf1.background(0,0,0,0);
    esf1.fill(10,100,200);
    esf1.ellipse(25,25,30,30);
    esf1.filter(BLUR,4);
  esf1.endDraw();
  
  esf = esf1.get();
  }
}

void walls(){
  if(g1==1){
  boundaries.add(new Boundary(width/2,(height-5),width,10));

  boundaries.add(new Boundary(width/2-25,650,width-350,10));
  boundaries.add(new Boundary(width/2-25,550,width-350,10));
  boundaries.add(new Boundary(width/2-25,450,width-350,10));
  boundaries.add(new Boundary(width/2-25,350,width-350,10));
  boundaries.add(new Boundary(width/2-25,250,width-350,10));
  
  boundaries.add(new Boundary(width/2+25,700,width-350,10));
  boundaries.add(new Boundary(width/2+25,600,width-350,10));
  boundaries.add(new Boundary(width/2+25,500,width-350,10));
  boundaries.add(new Boundary(width/2+25,400,width-350,10));
  boundaries.add(new Boundary(width/2+25,300,width-350,10));
  boundaries.add(new Boundary(width/2+25,200,width-350,10));
  
  boundaries.add(new Boundary(150,height/2,10,height));
  boundaries.add(new Boundary(750,height/2,10,height));
  }
}

void lineas(){
  if (a==0){
  stroke(255);
  //1
  line(0,78,900,543);
  
  //2
  line(0,338,900,116);
  
  //3
  line(0,445,900,626);
  
  //4
  line(0,489,900,126);
  
  //5
  line(0,539,900,642);
  
  //6
  line(0,652,900,130);
  
  //7
  line(0,900,900,677);
  
  //8
  line(146,900,792,0);
  
  //9
  line(800,900,900,732);
 
  ellipseMode(CENTER);
  }
}

void titulo(){
if(a==0){
  image(pachinkojp,width/2,height/2);
  image(ginga,width/2,280);
  image(pachgal,width/2,580);
  
  tint(random(210,255));
  image(of,580,430);
  
  t++;
  if(t>25){
    z=z+10;
    tint(255,z);
    image(pressstart,width/2,650);
    if(z>255){
      z=255;
      if (keyPressed){
  if (key == ENTER){
    pantalla=1;
    r++;
    enter.play();
    }
    } 
  }
  
  if(pantalla==1){
      fill(0);
    noStroke();
  rect(0,0,width,b=b+20);
  rect(0,900,width,0-(b=b+20));
  intro.pause();
  intro.rewind();
  }
    }
  }
  
  if(b>=width){
    a=1;
    beep.play();
  }
}

void inicio(){
  fondo();
  esfera();
  lineas();
  titulo();
}

void menu(){
  if(pantalla==1){
    t2++;
    if(t2>=200){
      t2=200;
    selectm.play();
    r=r-0.002;
    m1=1;
 
     if(m3==1){
      m2=0;
       pushMatrix();
    tint(255);
    image(introbg,width/2,height/2);
    translate(width/2, height/2);
    rotate(r);
    image(introbg, 0, 0);
  popMatrix();
    image(startbutton,width/2,750);
      
      image(bbpreview, width/2,460);
      image(select,width/2,350);
      
      textSize(16);
      text("broken bone - Sekai no Owari",120,220);
      text(mouseX,10,50);
      text(mouseY,50,50);
      text(t3,50,70);
      text(m2,50,90);
      fill(255);
      
      if(t3==1){
        t3=0;
        arrow.rewind();
        
        }
    }
    
    if(m1==1){
      m3=0;
       pushMatrix();
    tint(255);
    image(introbg,width/2,height/2);
    translate(width/2, height/2);
    rotate(r);
    image(introbg, 0, 0);
  popMatrix();
  
    image(startbutton,width/2,750);
      
      image(bbpreview, width/2,460);
      image(select,width/2,350);
      
      textSize(16);
      text("broken bone - Sekai no Owari",120,220);
      text(mouseX,10,50);
      text(mouseY,50,50);
      text(t3,50,70);
      text(m2,50,90);
      fill(255);
      
      if(t3==1){
        t3=0;
        arrow.rewind();
        
        }
    }
    
    if(m2==1){
    m1=0;
    
     pushMatrix();
    tint(255);
    image(introbg,width/2,height/2);
    translate(width/2, height/2);
    rotate(r);
    image(introbg, 0, 0);
  popMatrix();
  
    image(startbutton,width/2,750);
    image(lock,width/2,height/2);
    image(select,width/2,350);
      
      textSize(16);
      text("This song is locked.",120,220);
      text(mouseX,10,50);
      text(mouseY,50,50);
      text(t3,50,70);
      text(m2,50,90);
      fill(255);
    text(m1,50,110);
    }
    
    //test.loop();
    //image(test,width/2,height/2);
    }
  }
}

void juego(){
  if(pantalla==2){
        fill(0);
    noStroke();
  rect(0,0,width,b2=b2+20);
  rect(0,900,width,0-(b2=b2+20));
  t4++;
  m1=0;
  m2=0;
  m3=0;
  beep.play();
  selectm.pause();
  if(t4>=200){
      t4=200;
      g1=1;
    r=r+0.002;
  }
  }
  
  if(g1==1){
      m3=0;
       pushMatrix();
    tint(255);
    image(introbg,width/2,height/2);
    translate(width/2, height/2);
    rotate(r);
    image(introbg, 0, 0);
  popMatrix();
  
  
  box2d.step();
  
  if (random(1) < 0.1) {
    Box p = new Box(random(width),870);
    boxes.add(p);
  }
  
  if (mousePressed && (mouseButton == LEFT)) {
    for (Box b: boxes) {
     Vec2 wind = new Vec2(-30,-25);
     b.applyForce(wind);
    }
    
  }
  if (mousePressed && (mouseButton == RIGHT)) {
    for (Box b: boxes) {
     Vec2 wind = new Vec2(30, -25);
     b.applyForce(wind);
    }
  }

  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }

  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
      score=score+1;
    }
  }
  
  
  /*boundaries.add(new Boundary(width/2,(height-5),width,10));

  boundaries.add(new Boundary(width/2-25,650,width-350,10));
  boundaries.add(new Boundary(width/2-25,550,width-350,10));
  boundaries.add(new Boundary(width/2-25,450,width-350,10));
  boundaries.add(new Boundary(width/2-25,350,width-350,10));
  boundaries.add(new Boundary(width/2-25,250,width-350,10));
  
  boundaries.add(new Boundary(width/2+25,700,width-350,10));
  boundaries.add(new Boundary(width/2+25,600,width-350,10));
  boundaries.add(new Boundary(width/2+25,500,width-350,10));
  boundaries.add(new Boundary(width/2+25,400,width-350,10));
  boundaries.add(new Boundary(width/2+25,300,width-350,10));
  boundaries.add(new Boundary(width/2+25,200,width-350,10));
  
  boundaries.add(new Boundary(150,height/2,10,height));
  boundaries.add(new Boundary(750,height/2,10,height));*/
  
    image(gameui,width/2,height/2);
    
  text(score,20,40);
  text(mouseX,20,60);
  text(mouseY,60,60);
  
      
      /*textSize(16);
      text("broken bone - Sekai no Owari",120,220);
      text(mouseX,10,50);
      text(mouseY,50,50);
      text(t3,50,70);
      text(m2,50,90);
      fill(255);
      
      if(t3==1){
        t3=0;
        arrow.rewind();*/
        
        //}
  }
  
}

void fin(){
}

void mouseClicked(){
  if(mouseX>=65 && mouseX<=85 && mouseY >=205 && mouseY<=230){
      if(m1==1){
        arrow.play();
        t3=1; 
      }
      
      if(m2==1){
        arrow.play();
        t3=1;
        m3=1;
      }
    }
  
  if(mouseX>=812 && mouseX<=832 && mouseY >=205 && mouseY<=230){
      if(m1==1){
        arrow.play();
        t3=1;
        m2=1;
      }
    }
  
    if(mouseX>=313 && mouseX<=585 && mouseY >=710 && mouseY<=800){
      if(m1==1){
        beep.rewind();
        pantalla=2;
        
      }
    }
}

void movieEvent(Movie m) {
  m.read();
}