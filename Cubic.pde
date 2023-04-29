import controlP5.*;

import peasy.*;
import g4p_controls.*;
PeasyCam cam;
PGraphics botones;

int dim = 3;
final int UPP=0;
final int DWN=1;
final int RGT= 2;
final int LFT=3;
final int FRT=4;
final int BCK=5;
ControlP5 cp5;
//color[] Colors= {#FFFFF5,#FF0100,#F86B43,#F57C64,#64F5BC,#8464F5}
//blanco,amarillo,rojo,naranja,verde,azul
color[] Colors= {#FFFFF5,#F5E97B,#F57C64,#FF3B64,#64F5BC,#8464F5};
Cubie[][][] cube = new Cubie[dim][dim][dim];
void setup() {
  botones = createGraphics(1200,700);
  
  size(1200, 700, P3D);
 
  cam = new PeasyCam(this, 400);

  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        
        float len = 35;
        
        float offset = (dim-1) * len * 0.5;
        
        float x = len * i - offset;
        float y = len * j - offset;
        float z = len * k - offset;
        
        
        cube[i][j][k] = new Cubie(x, y, z, len);
        
      }
    }
  }
  
  
}

void draw() {
  background(#FEFAF2);
  botones.beginDraw();
  cp5 = new ControlP5(this);
  cp5.addButton("colorB");
  botones.endDraw();
  for (int i = 0; i < dim; i++) {
    for (int j = 0; j < dim; j++) {
      for (int k = 0; k < dim; k++) {
        
        cube[i][j][k].show();
        
      }
    }
  }
  
  
}
