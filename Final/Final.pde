//dimensiones para la pantalla

static int ancho=1200;
static int alto=500;

static PImage p40;
//imagenes del jugador, el enemigo, y fuentes para los textos
static PImage zero;
//pantalla inicial
static PImage titulo;
//fondo
static PImage fondo;
//textos pequeños
static PFont fuente;
//textos grandes
static PFont fuente2;

//contadores de vida y de enemigos derribados
static int contaT;
static int contaHP;
//otro
static int Pos;
static int ventana;

static float bullety;
static float bulletx;
static float enemyy;
static float enemyx;
static float alturaEnemy;


static Bala b; 
static Jugador P1; 
static Enemigo En; 


void setup()
{
 frameRate(30); // image draw latency still happening 
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
 println("Iniciando..");
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
  
  // clear para solucionar el lag de los enemigos
  
  clear();
  if (Pos <= (-1200)){
    Pos = 0;
  }
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
     println("Game Over");
  }
  
  //acierto
  
  bullety = b.yb;
  bulletx = b.xb;
  enemyy =  En.yei;
  enemyx = En.xei;
  alturaEnemy = enemyy + zero.height;
  
  if( (bullety >= enemyy) && (bullety <= alturaEnemy ) && (bulletx >= enemyx) ){
    println("---------------------------------------------------------");
    println("Enemigo interceptado por la bala!");
    println("Parte baja del enemigo <= altura bala <= parte alta del enemigo");
    println( enemyy +" <= "+ bullety +" <= "+ alturaEnemy);
    println("enemy x <= bullet x");
    println( enemyx +" <= " + bulletx );
        
    
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
        
        // reiniciar las variables del juego
       surface.setSize(ancho,alto);
       background(255,255,255);
       fuente=loadFont("PowerClear-Regular-36.vlw");
       fuente2=loadFont("gameover.vlw");
       p40=loadImage("P402.png");
       zero=loadImage("ZERO2.png");
       titulo=loadImage("titulo.png");
       fondo=loadImage("Fondo.png");
       contaHP=10;
       Pos=0;
       b = new Bala();
       P1 = new Jugador();
       En.reset();
       
        
      }
}
