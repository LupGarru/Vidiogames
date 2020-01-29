
//numero de enemigos simultaneos
int n=5;
//numero de disparos consecutivos
int ammo=5;

//dimensiones para la pantalla
int ancho=1200;
int alto=600;

//imagenes del jugador, el enemigo, y fuentes para los textos
PImage p40;
PImage zero;
//textos pequeños
PFont fuente;
//textos grandes
PFont fuente2;

//array balas
float bxi[]=new float[ammo];
float byi[]=new float[ammo];

//arrays enemigos
float zerx[]=new float[n];
float zery[]=new float[n];

//cooordenadas jugador
float p40x;
float p40y;

//velocidad a la que se mueven los enemigos
float velocidad[]=new float[n];

//movimiento del enemigo
boolean moveleft=true;

//acciona el disparo de la bala
boolean shoot=false;

boolean bullet=true;
boolean hit=false;

//contadores de vida y de enemigos derribados
int contaT;
int contaHP;

//radio para las balas
int radio;

//pantallas


int ventana;

void menu(){
background(135,206,235);
   textFont(fuente2);
    fill(255,215,0);
    text("DOGFIGHT",460,300);
    textFont(fuente);
    fill(0,0,0);
    text("PRESS SPACE BAR TO PLAY",524,350);
    
    
    if(keyPressed && key==' '){
      ventana=1; 
    }
}
void thegame(){
  
  background(255,255,255);
  textFont(fuente);
  
  
      
//interfaz pantalla de juego
      fill(73,72,42);
      text("Flying Tigers",50,50);
      text(contaT,250,50);
      fill(73,72,42);
      text("HP",800,50);
      text(contaHP,875,50);
      
//p40-jugador
      image(p40,p40x,p40y);
     if(keyPressed==true && key==CODED && keyCode==UP){
        p40y=p40y-3;
      }
      
      if(keyPressed==true && key==CODED && keyCode==DOWN){
        p40y=p40y+3;
      }
      
//zero-enemigo
      for (int i=0;i<n;i++){
      image(zero,zerx[i],zery[i]);
      zerx[i]=zerx[i]-velocidad[i];
      
//detectar enemigo que escapa 
    if(zerx[i]+zero.width<=0){
       zerx[i]=ancho+zero.width;
       zery[i]=(int)random(200,520);
       image(zero,zerx[i],zery[i]);
       velocidad[i]=random(0.5,5);
       
      contaHP--;
        }  
     }
      
//disparo
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
      
//limites de la bala
          if(bxi[j]+radio>=ancho/2){
              bxi[j]=p40x+175;
              byi[j]=p40y+p40.height/2;
              noStroke();
              noFill();
              ellipse(bxi[j],byi[j],5,5);
              shoot=false;
          }
      }
      
      //bala acierta 
      for(int i=0;i<n;i++){
        for(int j=0;j<ammo;j++){
      if(bxi[j]>=zerx[i] & byi[j]>=zery[i] || byi[j]>=zery[i]+zero.height){
        shoot=false;
        hit=true;
        
        zerx[i]=ancho+zero.width;
       zery[i]=(int)random(200,520);
       image(zero,zerx[i],zery[i]);
       velocidad[i]=random(0.5,5);
       
       
      }
      else{hit=false;}
        }
      }
      
      //reinicio de a bala si aacierta
        if(hit==true){
          for(int i=0;i<n;i++){
        for(int j=0;j<ammo;j++){
             bxi[j]=p40x+175;
             byi[j]=p40y+p40.height/2;
             noStroke();
             noFill();
             ellipse(bxi[j],byi[j],5,5);
          
          
          contaT++;
        }
          }
          
    }
  
 
  
  
  //derrota
  if(contaHP==0){
    ventana=2;
  }




}
void defeat(){
background(0,0,0);
    textFont(fuente2);
    fill(255,0,0);
    text("GAME OVER",460,300);
    textFont(fuente);
    fill(255,255,255);
    text("TRY AGAIN?",524,350);
    fill(0,255,0);
    text("C=YES",440,400);
    fill(255,0,0);
    text("X=NO",695,400);
    
      if(keyPressed==true && key=='c'){
       ventana=1;
       contaHP=contaHP-1;
      }
      
      if(keyPressed==true && key=='x'){
        ventana=0;
      }
}


void setup()
{
 surface.setSize(ancho,alto);
 background(255,255,255);


 p40=loadImage("P402.png");
 zero=loadImage("ZERO2.png");
 fuente=loadFont("PowerClear-Regular-36.vlw");
 fuente2=loadFont("gameover.vlw");
 p40x=0;
 p40y=alto/2-p40.height/2;

//enemigos
  for (int i=0;i<n;i++){
 velocidad[i]=random(0.5,5);
 zerx[i]=ancho;
 zery[i]=(int)random(200,520);
  }

//balas
  for (int j=0;j<ammo;j++){
 byi[j]=p40y+p40.height/2;
 bxi[j]=p40x+175;
  }

 ellipseMode(RADIUS);
 rectMode(RADIUS);

 
 radio=5; 
 ventana=0;
 contaHP=10;

}

void draw(){
  
  switch(ventana){
    case 0:
      menu();
      break;
    case 1:
      thegame();
      break;
    case 2:
      defeat();
      break;
  }
  
  

}
