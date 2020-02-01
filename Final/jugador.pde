class Jugador{
  float playerx;
  float playery;
  float veljugador;
  boolean MovUp;
  boolean MovDown;
  
  PImage p40;
  
  Jugador(){
    p40=loadImage("P402.png");
    playerx=0;
    playery=alto/2-p40.height/2;
    veljugador=5;
  }
  
  void display(){
    image(p40,playerx,playery);
  }
  
  }
  
  
