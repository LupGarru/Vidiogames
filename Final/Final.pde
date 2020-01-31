

//dimensiones para la pantalla
int ancho=1200;
int alto=600;

PImage p40;
//imagenes del jugador, el enemigo, y fuentes para los textos
PImage zero;
//textos pequeños
PFont fuente;
//textos grandes
PFont fuente2;

//contadores de vida y de enemigos derribados
int contaT;
int contaHP;

int ventana;

Bala b = new Bala();
Jugador P1 = new Jugador();
Enemigo En = new Enemigo();

class Jugador{
  float p40x;
  float p40y;
  float veljugador;
  
  PImage p40;
  
  Jugador(){
    p40=loadImage("P402.png");
    p40x=0;
    p40y=alto/2-p40.height/2;
    veljugador=3;
  }
  
  void movimiento(){
    if(teclas[0] && p40y>=200){
     p40y=p40y-veljugador;
    }
     if(teclas[1] && p40y+p40.height<=ancho){
      p40y=p40y+veljugador;
    }
  }
  
  void display(){
    image(p40,p40x,p40y);
  }
  
}

class Enemigo {
  float xei;
  float yei;
  float velEn;
  boolean movE;
  PImage zero;
  
  
  Enemigo(){
    zero= loadImage("ZERO2.png");
    xei=ancho;
    yei=random(200,alto-zero.height);
    velEn=random(1,10);
    movE=false;
  }
  
   void Movimiento(){
    if(ventana==1){
      movE=true;
    }
    if(movE==true){
     xei=xei+velEn; 
    }
  }
  void reset(){
    xei=ancho;
  }
  void display(){
    image(zero,xei,yei);
  }
}

class Bala {
 float xb;
 float yb;
 float velb;
 float radio;
 boolean disparo;
 
 
 
 Bala(){
   xb=-100;
   yb=-100;
   radio=5;
   
   
   velb=15;
   disparo=false;
 }
 
 void PosInicial(float xbi, float ybi){
   if(disparo==false){
     xb=xbi;
     yb=ybi;
     disparo=true;
     velb=20;
   } 
 }
 
 void actualizar(){
   if(xb+radio>=ancho/2){
     reset();
   }
 }
 void reset(){
  velb=0;
  disparo=false;
  yb=-100;
 }
 void display(){
  stroke(255,255,0);
  fill(255,127,80);
  ellipseMode(RADIUS);
  ellipse(xb,yb,radio,radio);
 }
 
}

boolean[] teclas=new boolean [4];
void keyPressed(){
 if(key == CODED && key==UP)
    teclas[0]=true;
 if(key == CODED && key==DOWN)
    teclas[1]=true;
 if(key == ' ')
    teclas[2]=true;
 if(key=='c')
    teclas[3]=true;
 if(key =='x')
    teclas[4]=true;   
}

void keyReleased() {
   if(key == CODED && key==UP)
    teclas[0]=false;
 if(key == CODED && key==DOWN)
    teclas[1]=false;
 if(key == ' ')
    teclas[2]=false;
 if(key=='c')
    teclas[3]=false;
 if(key =='x')
    teclas[4]=false;  
}


void menu(){
background(135,206,235);
   textFont(fuente2);
    fill(255,215,0);
    text("DOGFIGHT",460,300);
    textFont(fuente);
    fill(0,0,0);
    text("PRESS SPACE BAR TO PLAY",524,350);
    
    
    if(teclas[2]){
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
P1.display();

 
//zero-enemigo
En.display();
      
//disparo
  if(teclas[2]){
    b.PosInicial(P1.p40x,P1.p40y);
  }
  b.actualizar();
  b.display();
  

  
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
    
      if(teclas[3]){
       ventana=1;
       contaHP=contaHP-1;
      }
      
      if(teclas[4]){
        ventana=0;
      }
}



void setup()
{
 surface.setSize(ancho,alto);
 background(255,255,255);
 fuente=loadFont("PowerClear-Regular-36.vlw");
 fuente2=loadFont("gameover.vlw");
 p40=loadImage("P402.png");
 zero=loadImage("ZERO2.png");
 
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
