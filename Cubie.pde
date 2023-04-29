class Cubie{
 
  PVector pos;
  float len;
  
  Cubie(float x, float y, float z, float len_) {
    
    pos = new PVector(x,y,z);
    len = len_;
    
  }
  
  void show(){
    
    fill(255);
    stroke(0);
    strokeWeight(10);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    //
    beginShape(QUADS);
    float r= len/2;
    
     // z fijo
     fill(Colors[BCK]);
    vertex(-r, -r, -r);
    vertex(r, -r, -r);
    vertex(r, r, -r);
    vertex(-r, r, -r);
    

    fill(Colors[FRT]);
    vertex(-r, -r, r);
    vertex(r, -r, r);
    vertex(r, r, r);
    vertex(-r, r, r);

    // y fijo
    fill(Colors[DWN]);
    vertex(-r, -r, -r);
    vertex(r, -r, -r);
    vertex(r, -r, r);
    vertex(-r, -r, r);


    fill(Colors[UPP]);
    vertex(-r, r, -r);
    vertex(r, r, -r);
    vertex(r, r, r);
    vertex(-r, r, r);
  

    // x fijo
       fill(Colors[LFT]);
    vertex(-r, -r, -r);
    vertex(-r, r, -r);
    vertex(-r, r, r);
    vertex(-r, -r, r);
 

     fill(Colors[RGT]);

    vertex(r, -r, -r);
    vertex(r, r, -r);
    vertex(r, r, r);
    vertex(r, -r, r);
    endShape(CLOSE);

    
    
    
    //box(len);
    
    popMatrix();
    
  }
  
}
