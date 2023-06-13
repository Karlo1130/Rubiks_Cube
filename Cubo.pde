class Cubo{
  
  int dim = 3;
    
  int[] position = new int[27];
  
  Cubie[] cube = new Cubie[dim*dim*dim];
  
  ArrayList<Cubo[]> estadosVecinos2 = new ArrayList();
  ArrayList<Cubo[]> estadosVecinos3 = new ArrayList();
  
  Cubo(){
  
    int index = 0;
    for (int x = -1; x <= 1; x++) {
      for (int y = -1; y <= 1; y++) {
        for (int z = -1; z <= 1; z++) {
          PMatrix3D matrix = new PMatrix3D();
          matrix.translate(x, y, z);
          cube[index] = new Cubie(matrix, x, y, z, index);
          position[index] = cube[index].value;
          //System.out.println("X: "+x+"\n"+
          //"Y: "+y+"\n"+
          //"Z: "+z+"\n"+
          //"index: "+index);
          index++;
          }
      }
    }
  }
  
  Cubo(Cubo nuevoCubo){
   this.position = nuevoCubo.getPosition(); 
  }
  
  int[] getPosition(){
    return position;
  }
  
  Cubie[] getCubies(){
    return cube;
  }
  
  void setPosition(int[] nuevaPosition){
    
  for (int i = 0; i < nuevaPosition.length; i++) {
    this.position[i] = nuevaPosition[i];
  }
  }
  
  Cubo(int[] position){
     this.position = position;
    }
  
  void actualizar(){
    
  }
  
  Cubo cuboMasCercano(Cubo cuboRecibido, Grafo grafoCubo, ArrayList<Cubo> visitados) {

    Cubo resuelto = new Cubo();
      Cubo cuboCercano = null;
      int nodoGuardado = 0;
      int aux = 27;
      int distancia = 0;
    
    for (int i = 0; i < grafoCubo.getNodos().size(); i++) {
      boolean igual = Arrays.equals(cuboRecibido.getPosition(), grafoCubo.getNodos().get(i).getEstado());
      boolean visitado = false;
      
      for (int j = 0; j < visitados.size(); j++) {
        //visitado = grafo.getNodos().get(i).getEstado().equals(visitados.get(j).getPosition());
        visitado = Arrays.equals(grafoCubo.getNodos().get(i).getEstado(), visitados.get(j).getPosition());
        
        if(visitado)
          break;
      }
      
      if(!igual && !visitado) {

        for (int j = 0; j < 27; j++) {
          if (resuelto.getPosition()[j] != grafoCubo.getNodos().get(i).getEstado()[j]) {
            distancia++;
          }
        }

        if(distancia == 0) {
          cuboCercano = new Cubo(grafoCubo.getNodos().get(i).getEstado());
          nodoGuardado = i;
          aux = distancia;
          System.out.println("0efgdfg");
          break;
        }else if(distancia <= aux) {
          cuboCercano = new Cubo(grafoCubo.getNodos().get(i).getEstado());
          nodoGuardado = i;
          aux = distancia;
          System.out.println("pop: "+aux);
        }
      }
    }
    
    System.out.println("nodoGuardado: "+nodoGuardado);
    switch(nodoGuardado){
     case 1:
       resolverMovimientos.add(allMoves[8]);
     break;
     case 2:
       resolverMovimientos.add(allMoves[9]);
     break;
     case 3:
       resolverMovimientos.add(allMoves[11]);
     break;
     case 4:
       resolverMovimientos.add(allMoves[10]);
     break;
     case 5:
       resolverMovimientos.add(allMoves[2]);
     break;
     case 6:
       resolverMovimientos.add(allMoves[3]);
     break;
     case 7:
       resolverMovimientos.add(allMoves[1]);
     break;
     case 8:
       resolverMovimientos.add(allMoves[0]);
     break;
     case 9:
       resolverMovimientos.add(allMoves[7]);
     break;
     case 10:
       resolverMovimientos.add(allMoves[6]);
     break;
     case 11:
       resolverMovimientos.add(allMoves[4]);
     break;
     case 12:
       resolverMovimientos.add(allMoves[5]);
     break;
    }
    
    
    visitados.add(cuboCercano);
    
    
    
        return cuboCercano;  
  }
  
  Grafo crearGrafo(Cubo cubo, Cubo[] estadosVecinos){
    
    Grafo grafo = new Grafo();

    Nodo origen = new Nodo(cubo);

    Nodo[] vecinos  = new Nodo[12];
    Nodo[] vecinos2 = new Nodo[12*12];
    Nodo[] vecinos3 = new Nodo[12*12*12];
    
    ArrayList<Cubo[]> estadosVecinos2 = new ArrayList();
    ArrayList<Cubo[]> estadosVecinos3 = new ArrayList();
    
    for (int i = 0; i < vecinos.length; i++) {
      estadosVecinos2.add(crearEstados(estadosVecinos[i]));
    }
    
    for (int i = 0; i < vecinos.length; i++) {
      for (int j = 0; j < vecinos.length; j++) {
        estadosVecinos3.add(crearEstados(estadosVecinos2.get(i)[j]));
      }
    }
    
    int aux=0;
    int aux1=0;
    int nodos=0;
    int arcos=0;
    
    grafo.agregarNodo(origen);
    nodos++;
    arcos++;
    
    for (int i=0; i < estadosVecinos.length; i++){
      vecinos[i] = new Nodo(estadosVecinos[i]);
      
      grafo.agregarNodo(vecinos[i]);
      nodos++;
      grafo.agregarArco(new Arco(origen, vecinos[i]));
      arcos++;
    }

    for (int i=0; i < estadosVecinos.length; i++){
      for (int j = 0; j < estadosVecinos.length; j++) {
        vecinos2[aux] = new Nodo(estadosVecinos2.get(i)[j]);
//        grafo.agregarNodo(vecinos2[aux]);
//        nodos++;
//        grafo.agregarArco(new Arco(vecinos[i], vecinos2[aux]));
//        arcos++;
//        aux++;
      }
    }
    
    for (int i=0; i < vecinos2.length; i++){
      for (int j = 0; j < estadosVecinos.length; j++) {
//        vecinos3[aux1] = new Nodo(estadosVecinos3.get(i)[j]);
//        grafo.agregarNodo(vecinos3[aux1]);
//        nodos++;
//        grafo.agregarArco(new Arco(vecinos2[i], vecinos3[aux1]));
//        arcos++;
//        aux1++;
//        
      }
    }

    System.out.println(grafo.getNodos().get(0));
    System.out.println("nodos: "+nodos);
    System.out.println("arcos: "+arcos);
    
    return grafo;
  }

  Cubo[] crearEstados(Cubo nuevoCubo){

    Cubo[] estado = new Cubo[12];

    int[] originalPosition;
    int[] nuevaPosition = new int[27];

    for (int i=0; i < 12; i++){
      estado[i] = new Cubo();
      estado[i].setPosition(nuevoCubo.getPosition());
    }

    originalPosition = nuevoCubo.getPosition();
    
    //f
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    changePosition(nuevaPosition[2],
        nuevaPosition[11],
        nuevaPosition[20],
        nuevaPosition[5],
        nuevaPosition[23],
        nuevaPosition[8],
        nuevaPosition[17],
        nuevaPosition[26],
        nuevaPosition);

    estado[0].setPosition(nuevaPosition);

    //F
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];

    }

    changePositionReverse(nuevaPosition[2],
        nuevaPosition[11],
        nuevaPosition[20],
        nuevaPosition[5],
        nuevaPosition[23],
        nuevaPosition[8],
        nuevaPosition[17],
        nuevaPosition[26],
        nuevaPosition);

    estado[1].setPosition(nuevaPosition);

    //b
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    changePositionReverse(nuevaPosition[0],
        nuevaPosition[9],
        nuevaPosition[18],
        nuevaPosition[3],
        nuevaPosition[21],
        nuevaPosition[6],
        nuevaPosition[15],
        nuevaPosition[24],
        nuevaPosition);

    estado[2].setPosition(nuevaPosition);

    //B
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    changePosition(nuevaPosition[0],
        nuevaPosition[9],
        nuevaPosition[18],
        nuevaPosition[3],
        nuevaPosition[21],
        nuevaPosition[6],
        nuevaPosition[15],
        nuevaPosition[24],
        nuevaPosition);

    estado[3].setPosition(nuevaPosition);

    //u
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    changePositionReverse(nuevaPosition[0],
        nuevaPosition[1],
        nuevaPosition[2],
        nuevaPosition[9],
        nuevaPosition[11],
        nuevaPosition[18],
        nuevaPosition[19],
        nuevaPosition[20],
        nuevaPosition);

    estado[4].setPosition(nuevaPosition);

    //U
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    changePosition(nuevaPosition[0],
        nuevaPosition[1],
        nuevaPosition[2],
        nuevaPosition[9],
        nuevaPosition[11],
        nuevaPosition[18],
        nuevaPosition[19],
        nuevaPosition[20],
        nuevaPosition);

    estado[5].setPosition(nuevaPosition);

    //d
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    changePosition(nuevaPosition[6],
        nuevaPosition[7],
        nuevaPosition[8],
        nuevaPosition[15],
        nuevaPosition[17],
        nuevaPosition[24],
        nuevaPosition[25],
        nuevaPosition[26],
        nuevaPosition);

    estado[6].setPosition(nuevaPosition);

    //D
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    changePositionReverse(nuevaPosition[6],
        nuevaPosition[7],
        nuevaPosition[8],
        nuevaPosition[15],
        nuevaPosition[17],
        nuevaPosition[24],
        nuevaPosition[25],
        nuevaPosition[26],
        nuevaPosition);

    estado[7].setPosition(nuevaPosition);

    //l
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    changePosition(nuevaPosition[0],
        nuevaPosition[1],
        nuevaPosition[2],
        nuevaPosition[3],
        nuevaPosition[5],
        nuevaPosition[6],
        nuevaPosition[7],
        nuevaPosition[8],
        nuevaPosition);

    estado[8].setPosition(nuevaPosition);

    //L
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    changePositionReverse(nuevaPosition[0],
        nuevaPosition[1],
        nuevaPosition[2],
        nuevaPosition[3],
        nuevaPosition[5],
        nuevaPosition[6],
        nuevaPosition[7],
        nuevaPosition[8],
        nuevaPosition);

    estado[9].setPosition(nuevaPosition);

    //r
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    changePosition(nuevaPosition[18],
        nuevaPosition[19],
        nuevaPosition[20],
        nuevaPosition[21],
        nuevaPosition[23],
        nuevaPosition[24],
        nuevaPosition[25],
        nuevaPosition[26],
        nuevaPosition);

    estado[10].setPosition(nuevaPosition);

    //R
    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    changePositionReverse(nuevaPosition[18],
        nuevaPosition[19],
        nuevaPosition[20],
        nuevaPosition[21],
        nuevaPosition[23],
        nuevaPosition[24],
        nuevaPosition[25],
        nuevaPosition[26],
        nuevaPosition);

    estado[11].setPosition(nuevaPosition);

    for (int i=0; i < 27; i++){
      nuevaPosition[i] = originalPosition[i];
    }

    return estado;
  }

  void changePosition(int c0, int c1, int c2, int c3, 
      int c5, int c6, int c7, int c8,
      int[] nuevaPosition){
    int aux6, aux8, aux2;

    aux6 = nuevaPosition[c6];
    nuevaPosition[c6] = nuevaPosition[c0];

    aux8 = nuevaPosition[c8];
    nuevaPosition[c8] = aux6;

    aux2 = nuevaPosition[c2];
    nuevaPosition[c2] = aux8;

    nuevaPosition[c0] = aux2;

    int aux3, aux7, aux5;

    aux3 = nuevaPosition[c3];
    nuevaPosition[c3] = nuevaPosition[c1];

    aux7 = nuevaPosition[c7];
    nuevaPosition[c7] = aux3;

    aux5 = nuevaPosition[c5];
    nuevaPosition[c5] = aux7;

    nuevaPosition[c1] = aux5;

  }

  void changePositionReverse(int c0, int c1, int c2, int c3, 
      int c5, int c6, int c7, int c8,
      int[] nuevaPosition){

    int aux0, aux8, aux2;

    aux0 = nuevaPosition[c0];
    nuevaPosition[c0] = nuevaPosition[c6];

    aux2 = nuevaPosition[c2];
    nuevaPosition[c2] = aux0;

    aux8 = nuevaPosition[c8];
    nuevaPosition[c8] = aux2;

    nuevaPosition[c6] = aux8;

    int aux1, aux7, aux5;

    aux1 = nuevaPosition[c1];
    nuevaPosition[c1] = nuevaPosition[c3];

    aux5 = nuevaPosition[c5];
    nuevaPosition[c5] = aux1;

    aux7 = nuevaPosition[c7];
    nuevaPosition[c7] = aux5;

    nuevaPosition[c3] = aux7;

  }
  
}
