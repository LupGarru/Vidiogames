class Enemigo {
  float xei;
  float yei;
  float velEn;
  PImage zero;
  
  
  Enemigo(){
    zero= loadImage("ZERO2.png");
    xei=ancho;
    yei=random(200,alto-zero.height);
    velEn=random(5,10);
  }
  
   void Movimiento(){
     xei=xei-velEn; 
   
  }
  void reset(){
    xei=ancho;
    yei=random(200,alto-zero.height);
    velEn=random(6,12);
  }
  void stopEn(){
   xei=ancho;
   velEn=0;
  }
  void display(){
    image(zero,xei,yei);
  }
}
