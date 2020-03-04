private double globalmult = .1; 
private int smallestBranch = 5; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);    
	 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);
  translate(320,380);
  noFill();
  //bezier(0,0,0,-20,0,-45,-20,-60);
  
  branch(80,globalmult);
  if(globalmult < .75){
    globalmult += .001;
  }
  //will add later 
} 
public void branch(double scale, double mult){
  if(mult >= 1){
    mult = .5;
  }
  boolean splitting = false;
  if(scale * mult >= smallestBranch){
    splitting = true;
  }
	bezier(0,0,0,(float)(-scale/3),0,(float)(-3*scale/4),(float)(-scale/3),(float)(-scale));
  if(splitting){
    translate((float)(-scale/3),(float)(-scale));
    rotate((float)(-Math.PI/4));
    branch(scale * mult, mult);
    rotate((float)(Math.PI/4));
    translate((float)(scale/3),(float)(scale));
  }
  bezier(0,0,0,(float)(-scale/3),0,(float)(-3*scale/4),(float)(scale/3),(float)(-scale));
  if(splitting){
    translate((float)(scale/3),(float)(-scale));
    rotate((float)(Math.PI/4));
    branch(scale * mult, mult);
    rotate((float)(-Math.PI/4));
    translate((float)(-scale/3),(float)(scale));
  }
} 
