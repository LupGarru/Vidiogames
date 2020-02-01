

//dimensiones para la pantalla
int ancho=1200;
int alto=500;

PImage p40;
//imagenes del jugador, el enemigo, y fuentes para los textos
PImage zero;
//pantalla inicial
PImage titulo;
//fondo
PImage fondo;
//textos pequeños
PFont fuente;
//textos grandes
PFont fuente2;

//contadores de vida y de enemigos derribados
int contaT;
int contaHP;
//otro
int Pos;
int ventana;


Bala b; 
Jugador P1; 
Enemigo En; 

void setup()
{
 surface.setSize(ancho,alto);
 background(255,255,255);
 fuente=loadFont("PowerClear-Regular-36.vlw");
 fuente2=loadFont("gameover.vlw");
 p40=loadImage("P402.png");
 zero=loadImage("ZERO2.png");
 titulo=loadImage("titulo.png");
 fondo=loadImage("Fondo.png");
 
 ventana=0;
 contaHP=10;
 Pos=0;
 b = new Bala();
 P1 = new Jugador();
 En= new Enemigo();
 

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

void menu(){
  image(fondo,Pos%fondo.width,0);
  image(titulo,0,0);
  Pos--;

    if(keyPressed && key==' '){
      ventana=1; 
    }
}
void thegame(){
  
  image(fondo,Pos%fondo.width,0);
  Pos--;
  textFont(fuente);
  
//interfaz pantalla de juego
      fill(73,72,42);
      text("Flying Tigers",50,50);
      text(contaT,250,50);
      fill(73,72,42);
      text("HP",800,50);
      text(contaHP,875,50);
      
//p40-jugador
if(keyPressed==true && key==CODED && keyCode==UP&&P1.playerx<=200){
 P1.playery=P1.playery-P1.veljugador; 
}
if(keyPressed==true && key==CODED && keyCode==DOWN&&P1.playerx+p40.height<=alto){
 P1.playery=P1.playery+P1.veljugador; 
}
P1.display();



 
//zero-enemigo
En.display();
En.Movimiento();
      
//disparo
  if(keyPressed && key==' '){
    b.PosInicial(P1.playerx+175,P1.playery+p40.height/2);
  }
  b.actualizar();
  b.display();
  
  if(En.xei+zero.width<=0){
   enemigoEscapa(); 
  }

  
  //derrota
  if(contaHP==0){
    ventana=2;
  }
  
  //acierto
  if(b.yb>=En.yei && b.xb<=En.yei+zero.height && b.xb>=En.xei){
    enemigoDerribado();
  }




}
void defeat(){
  background(0,0,0);
  b.reset();
  En.stopEn();
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
       contaHP=10;
       En.reset();
      }
      
      if(keyPressed==true && key=='x'){
        ventana=0;
        
      }
}
