float 
ctrx, ctry, r, g, b, 
dotx1, doty1, dotx2, doty2, disx, disy, toggledraw, smoothrate,
lightswitch;

void setup()
{
frame.setTitle("Like Kidpix, but worse.");

size((1920/2), (1080/2));
background (255);

 dotx1 = ctrx;
 doty1 = ctry;
 toggledraw=0;
 smoothrate=30;
 lightswitch=255;

 

}

void draw()
{
  //had these here originally, but the limiter code wouldn't work
  //it's fixed now, but still noting for later
  //mouseXv = mouseX;
  //mouseYv = mouseY;
 
//fade
//rectMode(CORNER);
//noStroke();
//fill(255);
//rect(0, 0, width, height);

//the dot
if(toggledraw==0){
r = r+random (-25, 25);
g = g+random (-25, 25);
b = b+random (-25, 25);
if (r<0) r = r+10;
if (g<0) g = g+10;
if (b<0) b = b+10;
if (r>255) r = r-10;
if (g>255) g = g-10;
if (b>255) b = b-10;
 fill(r, g, b, 255);
 stroke(0, 0, 0, 0) ;
 ellipse(dotx1, doty1, 5, 5);}


float disx = (mouseX-dotx1)/smoothrate;
float disy = (mouseY-doty1)/smoothrate;
 dotx2 = dotx1 + disx;
 doty2 = doty1 + disy;
 dotx1 = dotx2;
 doty1 = doty2;
 
}


void keyPressed()
{
  //eraser
  if(key=='r'||key=='R') background(lightswitch);
  //toggles the draw
  if(key=='t'||key=='T') toggledraw = 1-(toggledraw/1);
  if(key=='t'||key=='T') dotx1=mouseX;
  if(key=='t'||key=='T') doty1=mouseY;
  //changes how smooth the dot's path is
  if ((key=='q'||key=='Q')&&(smoothrate>10))smoothrate=smoothrate-10;
  if ((key=='q'||key=='Q')&&(smoothrate==10))smoothrate=smoothrate-9;
  if ((key=='q'||key=='Q')&&(smoothrate==1))smoothrate=smoothrate;
  if ((key=='w'||key=='W')&&(smoothrate==1))smoothrate=smoothrate+9;
  if ((key=='w'||key=='W')&&(smoothrate<100))smoothrate=smoothrate+10;
  if ((key=='w'||key=='W')&&(smoothrate==100))smoothrate=smoothrate;
  if (key=='e'||key=='E')smoothrate=30;
  //changes background from white to black
  if (key=='s'||key=='S')lightswitch=(-1*(lightswitch-255));
  if (key=='s'||key=='S')background(lightswitch);
  //saves a screenshot
  if (key=='='||key=='+') save ("dot_bg_.png");
}


