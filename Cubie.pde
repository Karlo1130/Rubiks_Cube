class Cubie {
  PMatrix3D matrix;
  int x = 0;
  int y = 0;
  int z = 0;
  int value = 0;
  color c;
  Face[] faces = new Face[6];

  Cubie(PMatrix3D m, int x, int y, int z, int value) {
    this.matrix = m;
    this.x = x;
    this.y = y;
    this.z = z;
    this.value = value;
    c = color(255);

    faces[0] = new Face(new PVector(0, 0, -1), color(#8464F5));
    faces[1] = new Face(new PVector(0, 0, 1), color(#64F5BC));
    faces[2] = new Face(new PVector(0, 1, 0), color(#FFFFF5));
    faces[3] = new Face(new PVector(0, -1, 0), color(#F5E97B));
    faces[4] = new Face(new PVector(1, 0, 0), color(#F57C64));
    faces[5] = new Face(new PVector(-1, 0, 0), color(#FF3B64));
  }
  
  void turnFacesZ(int dir) {
    for (Face f : faces) {
      f.turnZ(dir*HALF_PI); 
    }
  }

  void turnFacesY(int dir) {
    for (Face f : faces) {
      f.turnY(dir*HALF_PI); 
    }
  }

    void turnFacesX(int dir) {
    for (Face f : faces) {
      f.turnX(dir*HALF_PI); 
    }
  }
  
  
  
  void update(int x, int y, int z) {
    matrix.reset(); 
    matrix.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void show() {
    //fill(c);
    noFill();
    stroke(0);
    strokeWeight(0.2);
    pushMatrix(); 
    applyMatrix(matrix);
    box(1);
    for (Face f : faces) {
      f.show();
    }
    popMatrix();
  }
}
