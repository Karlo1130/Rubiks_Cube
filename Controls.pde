void keyPressed() {
  if (key == ' ') {
    //counter = 0;
    currentMove.start();
  }
   applyMove(key);
}

void applyMove(char move) {
    
  switch (move) {
  case 'f': 
    if (currentMove.finished()) {
      currentMove = new Move(0, 0, 1, 1);
      
      changePosition(position[2],
      position[11],
      position[20],
      position[5],
      position[23],
      position[8],
      position[17],
      position[26]);
      
      currentMove.start();
    }
    break;
  case 'F': 
    if (currentMove.finished()) {
      currentMove = new Move(0, 0, 1, -1);
      
      changePositionReverse(position[2],
      position[11],
      position[20],
      position[5],
      position[23],
      position[8],
      position[17],
      position[26]);
      
      currentMove.start();
    }
    break;
  case 'b': 
    if (currentMove.finished()) {
      currentMove = new Move(0, 0, -1, -1);
      
      changePositionReverse(position[0],
      position[9],
      position[18],
      position[3],
      position[21],
      position[6],
      position[15],
      position[24]);
      
      currentMove.start();
    }
    break;
  case 'B': 
    if (currentMove.finished()) {
      currentMove = new Move(0, 0, -1, 1);
      
      changePosition(position[0],
      position[9],
      position[18],
      position[3],
      position[21],
      position[6],
      position[15],
      position[24]);
      
      currentMove.start();
    }
    break;
  case 'u': 
    if (currentMove.finished()) {
      currentMove = new Move(0, -1, 0, 1);
      
      changePositionReverse(position[0],
      position[1],
      position[2],
      position[9],
      position[11],
      position[18],
      position[19],
      position[20]);
      
      currentMove.start();
    }
    break;
  case 'U': 
    if (currentMove.finished()) {
      currentMove = new Move(0, -1, 0, -1);
      
      changePosition(position[0],
      position[1],
      position[2],
      position[9],
      position[11],
      position[18],
      position[19],
      position[20]);
      
      currentMove.start();
    }
    break;
  case 'd': 
    if (currentMove.finished()) {
      currentMove = new Move(0, 1, 0, -1);
      
      changePosition(position[6],
      position[7],
      position[8],
      position[15],
      position[17],
      position[24],
      position[25],
      position[26]);
      
      currentMove.start();
    }
    break;
  case 'D': 
    if (currentMove.finished()) {
      currentMove = new Move(0, 1, 0, 1);
      
      changePositionReverse(position[6],
      position[7],
      position[8],
      position[15],
      position[17],
      position[24],
      position[25],
      position[26]);
      
      currentMove.start();
    }
    break;
  case 'l': 
    if (currentMove.finished()) {
      currentMove = new Move(-1, 0, 0, -1);
      
      changePosition(position[0],
      position[1],
      position[2],
      position[3],
      position[5],
      position[6],
      position[7],
      position[8]);
      
      currentMove.start();
    }
    break;
  case 'L': 
    if (currentMove.finished()) {
      currentMove = new Move(-1, 0, 0, 1);
      
      changePositionReverse(position[0],
      position[1],
      position[2],
      position[3],
      position[5],
      position[6],
      position[7],
      position[8]);
      
      currentMove.start();
    }
    break;
  case 'r': 
    if (currentMove.finished()) {
      currentMove = new Move(1, 0, 0, 1);
      
      changePosition(position[18],
      position[19],
      position[20],
      position[21],
      position[23],
      position[24],
      position[25],
      position[26]);
      
      currentMove.start();
    }
    break;
  case 'R': 
    if (currentMove.finished()) {
      currentMove = new Move(1, 0, 0, -1);
      
      changePositionReverse(position[18],
      position[19],
      position[20],
      position[21],
      position[23],
      position[24],
      position[25],
      position[26]);
      
      currentMove.start();
    }
    break;
  case 's':
  case 'S':
    shuffling = true;
    shuffle = new Shuffle(10);
    break;
  }
  
}

void changePosition(int c0, int c1, int c2, int c3, 
                    int c5, int c6, int c7, int c8){
    int aux6, aux8, aux2;
    
    aux6 = position[c6];
    position[c6] = position[c0];
    
    aux8 = position[c8];
    position[c8] = aux6;
    
    aux2 = position[c2];
    position[c2] = aux8;
    
    position[c0] = aux2;
    
    int aux3, aux7, aux5;
    
    aux3 = position[c3];
    position[c3] = position[c1];
    
    aux7 = position[c7];
    position[c7] = aux3;
    
    aux5 = position[c5];
    position[c5] = aux7;
    
    position[c1] = aux5;
    
  }
  
  void changePositionReverse(int c0, int c1, int c2, int c3, 
                    int c5, int c6, int c7, int c8){

    int aux0, aux8, aux2;
    
    aux0 = position[c0];
    position[c0] = position[c6];
    
    aux2 = position[c2];
    position[c2] = aux0;
    
    aux8 = position[c8];
    position[c8] = aux2;
    
    position[c6] = aux8;
    
    int aux1, aux7, aux5;
    
    aux1 = position[c1];
    position[c1] = position[c3];
    
    aux5 = position[c5];
    position[c5] = aux1;

    aux7 = position[c7];
    position[c7] = aux5;
    
    position[c3] = aux7;
    
  }
