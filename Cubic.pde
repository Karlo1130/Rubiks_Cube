import peasy.*;

PeasyCam cam;

float speed = 0.1;
int dim = 3;
Cubie[] cube = new Cubie[dim*dim*dim];

int[] position = new int[27];

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
  
  int index = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, x, y, z, index);
        position[index] = cube[index].value;
        System.out.println("X: "+x+"\n"+
        "Y: "+y+"\n"+
        "Z: "+z+"\n"+
        "index: "+index);
        index++;
      }
    }
  }

  currentMove = new Move(0, 0, 0, 1);

  currentMove.start();
  
  Nodo V9 = new Nodo("Nueve");
    Nodo V8 = new Nodo("Ocho");
        Nodo V7 = new Nodo("Siete");
        Nodo V6 = new Nodo("Seis");
        Nodo V5 = new Nodo("Cinco");
        Nodo V4 = new Nodo("Cuatro");
        Nodo V3 = new Nodo("Tres");
        Nodo V2 = new Nodo("Dos");
        Nodo V1 = new Nodo("Uno");
        
        /*Agregar conexion entre los nodos*/
//        V8.quitarArco(V8.getArcos().get(1));
        
//        V1.agregarArco(new Arco(V1, V2));
//        V1.agregarArco(new Arco(V1, V4));
//        
//        V2.agregarArco(new Arco(V2, V1));
//        V2.agregarArco(new Arco(V2, V3));
//        V2.agregarArco(new Arco(V2, V5));
//        
//        V3.agregarArco(new Arco(V3, V2));
//        V3.agregarArco(new Arco(V3, V6));
//        
//        V4.agregarArco(new Arco(V4, V1));
//        V4.agregarArco(new Arco(V4, V5));
//        V4.agregarArco(new Arco(V4, V7));
//        
//        V5.agregarArco(new Arco(V5, V2));
//        V5.agregarArco(new Arco(V5, V4));
//        V5.agregarArco(new Arco(V5, V6));
//        V5.agregarArco(new Arco(V5, V8));
//        
//        V6.agregarArco(new Arco(V6, V3));
//        V6.agregarArco(new Arco(V6, V5));
//        V6.agregarArco(new Arco(V6, V9));
//        
//        V7.agregarArco(new Arco(V7, V4));
//        V7.agregarArco(new Arco(V7, V8));
//        
//        V8.agregarArco(new Arco(V8, V5));
//        V8.agregarArco(new Arco(V8, V7));
//        V8.agregarArco(new Arco(V8, V9));
//        
//        V9.agregarArco(new Arco(V9, V6));
//        V9.agregarArco(new Arco(V9, V8));

        /*Crear el grafo agregando los nodos*/
        Grafo grafo = new Grafo();
        grafo.agregarNodo(V1);
        grafo.agregarNodo(V2);
        grafo.agregarNodo(V3);
        grafo.agregarNodo(V4);
        grafo.agregarNodo(V5);
        grafo.agregarNodo(V6);
        grafo.agregarNodo(V7);
        grafo.agregarNodo(V8);
        grafo.agregarNodo(V9);
        
        //crear arcos
        
        grafo.agregarArco(new Arco(V1, V2));
        grafo.agregarArco(new Arco(V1, V4));
        
        grafo.agregarArco(new Arco(V2, V5));
        grafo.agregarArco(new Arco(V2, V3));
        
        grafo.agregarArco(new Arco(V3, V6));
        
        grafo.agregarArco(new Arco(V4, V5));
        grafo.agregarArco(new Arco(V4, V7));
        
        grafo.agregarArco(new Arco(V5, V6));
        grafo.agregarArco(new Arco(V5, V8));
        
        grafo.agregarArco(new Arco(V6, V9));
        
        grafo.agregarArco(new Arco(V7, V8));
        
        grafo.agregarArco(new Arco(V8, V9));
        
        grafo.quitarArco(grafo.getArcos().remove(3));
        grafo.quitarArco(grafo.getArcos().remove(6));
        grafo.quitarArco(grafo.getArcos().remove(9));
        
        /*imprimir la informacion del grafo*/
        System.out.println(grafo);
        System.out.println("\n");
        
        System.out.println(grafo.recorridoProfundidad(V8));
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
    /*
    System.out.println("X: "+cube[i].x+"\n"+
        "Y: "+cube[i].y+"\n"+
        "Z: "+cube[i].z+"\n");
        */
        /*
        System.out.println("X: "+cube[i].x+"\n"+
        "Y: "+cube[i].y+"\n"+
        "Z: "+cube[i].z+"\n"+
        "value: "+cube[i].value+"\n");
        */
    System.out.println("posicion secundaria");
         System.out.println("posicion "+(i)+": "+position[i]);
    
    cube[i].show();
    pop();
  }
}
