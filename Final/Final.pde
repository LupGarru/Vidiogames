int n=3;
int ammo=5;


int ancho=1200;
int alto=600;

PImage p40;
PImage zero;
PFont fuente;

float bxi[]=new float[ammo];
float byi[]=new float[ammo];

float zerx[]=new float[n];
float zery[]=new float[n];

float p40x;
float p40y;

float velocidad[]=new float[n];

boolean moveleft=true;
boolean shoot=false;

boolean bullet=true;
boolean hit=false;

int contaT;
int contaZ;


int radio;

void setup()
{
 surface.setSize(ancho,alto);
 background(255,255,255);


 p40=loadImage("P402.png");
 zero=loadImage("ZERO2.png");
 fuente=loadFont("PowerClear-Regular-36.vlw");
 p40x=0;
 p40y=alto/2-p40.height/2;

for (int i=0;i<n;i++){
 velocidad[i]=random(0.5,5);
 zerx[i]=ancho;
 zery[i]=(int)random(0,alto-zero.height);
}

for (int j=0;j<ammo;j++){
 byi[j]=p40y+p40.height/2;
 bxi[j]=p40x+175;
}
 ellipseMode(RADIUS);
 
 radio=5; 

}

void draw(){
  background(255,255,255);
  textFont(fuente);
      
      fill(73,72,42);
      text("Flying Tigers",50,50);
      text(contaT,250,50);
      fill(73,72,60);
      text("Zeros",800,50);
      text(contaZ,900,50);
      
      //p40
      image(p40,p40x,p40y);
     if(keyPressed==true && key==CODED && keyCode==UP){
        p40y=p40y-3;
      }
      
      if(keyPressed==true && key==CODED && keyCode==DOWN){
        p40y=p40y+3;
      }
      
      //zero
      for (int i=0;i<n;i++){
      image(zero,zerx[i],zery[i]);
      zerx[i]=zerx[i]-velocidad[i];
      
      
    if(zerx[i]+zero.width<=0){
       zerx[i]=ancho+zero.width;
       zery[i]=(int)random(0,alto-zero.height);
       image(zero,zerx[i],zery[i]);
       velocidad[i]=random(0.5,5);
       
       contaZ++;
    }
      }
      
     
      for (int j=0;j<ammo;j++){
      if(keyPressed && key == ' '){
        shoot=true;
      }      
      if(shoot==true){
         noStroke();
         fill(255,127,80);
         ellipse(bxi[j],byi[j],radio,radio);
         bxi[j]=bxi[j]+15;
      }      
      if(bxi[j]+radio>=ancho){
        bxi[j]=p40x+175;
       byi[j]=p40y+p40.height/2;
      noStroke();
      noFill();
      ellipse(bxi[j],byi[j],5,5);
        shoot=false;
      }
      }
      
      for(int i=0;i<n;i++){
        for(int j=0;j<ammo;j++){
      if(bxi[j]>=zerx[i] & byi[j]>=zery[i] || byi[j]>=zery[i]+zero.height){
         bxi[j]=p40x+175;
       byi[j]=p40y+p40.height/2;
      noStroke();
      noFill();
      ellipse(bxi[j],byi[j],5,5);
        shoot=false;
        hit=true;
        
        zerx[i]=ancho+zero.width;
       zery[i]=(int)random(0,alto-zero.height);
       image(zero,zerx[i],zery[i]);
       velocidad[i]=random(0.5,5);
       
       
      }
      else{hit=false;}
        }
      }
      
        if(hit==true){
          contaT++;
        }
        
        
    
      

   
      
    }
