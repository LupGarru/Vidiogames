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
   if(disparo==true){
     xb=xb+velb;
   }
   if(xb+radio>=ancho/2){
     reset();
   }
 }
 void reset(){
  velb=0;
  disparo=false;
  yb=-100;
  xb=-100;
 }
 void display(){
  stroke(255,255,0);
  fill(255,127,80);
  ellipseMode(RADIUS);
  ellipse(xb,yb,radio,radio);
 }
 
}
