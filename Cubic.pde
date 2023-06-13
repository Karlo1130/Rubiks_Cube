import peasy.*;
import java.util.Map;
import java.util.Arrays;

PeasyCam cam;

float speed = 0.1;
//int dim = 3;

boolean resolver = false;
int contador = 0;

boolean resuelto = true;

  ArrayList<Cubo> visitados = new ArrayList();
  ArrayList<Cubo> reiniciador = new ArrayList();

  Cubo cuboResuelto = new Cubo();
  
  int[] estado = {2, 15, 6, 1, 4, 23, 8, 11, 24, 7, 10, 21, 12, 13, 14, 5, 16, 25, 0, 9, 26, 19, 22, 3, 20, 17, 18};

  Cubo cubo = new Cubo();
  Cubo nuevoCubo = new Cubo();
  
  Cubie[] cube = cubo.getCubies();
  int[] position = cubo.getPosition();
  
  Grafo grafo = new Grafo();
  
Move[] allMoves = new Move[] {
  new Move(0, 1, 0, 1), 
  new Move(0, 1, 0, -1), 
  new Move(0, -1, 0, 1), 
  new Move(0, -1, 0, -1), 
  new Move(1, 0, 0, 1), 
  new Move(1, 0, 0, -1), 
  new Move(-1, 0, 0, 1), 
  new Move(-1, 0, 0, -1), 
  new Move(0, 0, 1, 1), 
  new Move(0, 0, 1, -1), 
  new Move(0, 0, -1, 1), 
  new Move(0, 0, -1, -1) 
};

ArrayList<Move> sequence = new ArrayList<Move>();

ArrayList<Move> resolverMovimientos = new ArrayList<Move>();

Shuffle shuffle;

boolean started = false;
boolean shuffling;

Move currentMove;

void setup() {
  size(1200, 700, P3D);
  //fullScreen(P3D);
  cam = new PeasyCam(this, 550);
  cam.setMinimumDistance(200);
  cam.setMaximumDistance(500);

  currentMove = new Move(0, 0, 0, 1);
  //currentMove = new Move(0, 0, 1, 1);
  
  //System.out.println(grafo);
  
  currentMove.start();
}

void draw() {
  background(#FEFAF2); 

  //cam.beginHUD();
  //fill(255);
  //textSize(32);
  //text(counter, 100, 100);
  //cam.endHUD();

  rotateX(-0.3);
  rotateY(0.4);
  rotateZ(0.05);
  
  currentMove.update();
  
  if (shuffling) {
    shuffle.update();
  }
  
  if (resolver) {
    
    if (currentMove.finished()) {
      if (contador <= resolverMovimientos.size() - 1) {
        currentMove = resolverMovimientos.get(contador);
        currentMove.start();
        contador++;
        System.out.println("si: "+contador);
      } else {
        contador = 0;
        resolverMovimientos = new ArrayList<Move>();
        position = cuboResuelto.getPosition();
        resolver = false;
        System.out.println(contador);
      }
    }
    //System.out.println(resolver);
  }
/*
  for(int i = 0; i<27; i++){
      System.out.println(position[i]); 
    }
*/
  scale(50);
  for (int i = 0; i < cube.length; i++) {
    push();
    if (abs(cube[i].z) > 0 && cube[i].z == currentMove.z) {
      rotateZ(currentMove.angle);
    } else if (abs(cube[i].x) > 0 && cube[i].x == currentMove.x) {
      rotateX(currentMove.angle);
    } else if (abs(cube[i].y) > 0 && cube[i].y == currentMove.y) {
      rotateY(-currentMove.angle);
    }
    
    //cubo.setPosition(estado);
    
    resuelto = Arrays.equals(cubo.getPosition(), cuboResuelto.getPosition());
    //System.out.println(resuelto);
    /*
    for(int j = 0; i<26; i++){
      System.out.println(position[j]); 
    }
    */
    /*
    if(resuelto) {
          System.out.println("el cubo SI esta resuelto");
        }else{
          System.out.println("el cubo NO esta resuelto");
        }
    */
    cube[i].show();
    pop();
  }
}
