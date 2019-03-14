//PImage
PImage bg;
PImage groundhog;
PImage life;
PImage robot;
PImage soil;
PImage soldier;
//grid
int grid=80;
//soldier
int soldierSpeed=1;
float soldierX=-80;
float soldierY;
//robot
float robotX, robotY;
//lazer
float lazerWidth=40;
int lazerSpeed = -2;
float lazerX;
float lazerOffset;


void setup() {
	size(640, 480, P2D);
	// Enter Your Setup Code Here
  // loadImage
  bg = loadImage("img/bg.jpg");
  groundhog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soil = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");
  
  //set soldierY randomly
  soldierY =grid*2+grid*floor(random(0,4));
  
  //set robot position randomly
  robotX = random(grid*2,width-robot.width);
  robotY= grid*2+grid*floor(random(0,4));
  lazerX = robotX;
}

void draw() {
  //
  // set up scene
  image(bg,0,0);
  rectMode(CORNERS);//grass
  noStroke();
  fill(124,204,25);
  rect(0,grid*2-15,width,grid*2);//grass
  image(soil,0,grid*2);
  image(life,10,10);
  image(life,10+life.width+20,10);
  image(life,10+life.width*2+20*2,10);
  image(groundhog,320-40,grid);
  strokeWeight(5);//sun
  stroke(255,255,0);
  fill(253,184,19);
  ellipse(width-50,50,120,120);//sun
  
  //soldier
  soldierX += 5;
  if(soldierX>640+soldier.width){
    soldierX=-80;
    
 
  }//loop from left to right
    ;
  image(soldier,soldierX,soldierY);
  
  //set robot
  image(robot,robotX,robotY);
  
  //lazer
  stroke(255,0,0);
  strokeWeight(10);
  lazerOffset--;
  lazerOffset %= grid*2;
  lazerX=robotX+25+lazerOffset;
  line(lazerX,robotY+37,min(lazerX+lazerWidth,robotX+25),robotY+37);
 
  
	// Enter Your Code Here
}
