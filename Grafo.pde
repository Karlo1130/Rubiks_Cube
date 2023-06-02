import java.util.ArrayList;
import java.util.List;

class Grafo{
  
  private List<Nodo> nodos;
  public List<Arco> arcos;  
   
    public void agregarNodo(Nodo nodo) {
        if (nodos == null) {
          nodos = new ArrayList<>();
        }
        nodos.add(nodo);
    }
 
    public List<Nodo> getNodos() {
        return nodos;
    }
    
    public void agregarArco(Arco arco) {
        if (arcos == null) {
          arcos = new ArrayList<>();
        }
        arcos.add(arco);
    }
    
    public void quitarArco(Arco arco) {

        arcos.remove(arco);
    }
    
    public List<Arco> getArcos() {
        return arcos;
    }
    
    public String recorridoProfundidad(Nodo nodoInicial) {
      String recorrido = "Recorrido por profundidad (Inicial="+nodoInicial.getVertice()+"): ";
      List<Nodo> pila = new ArrayList<>();
      List<Arco> arquitos = new ArrayList<>();
      
      int ultimoPila=0;
      pila.add(nodoInicial);
      
      if(nodoInicial!=null) {
        while(ultimoPila>=0) {
          Nodo nodoActual = pila.get(ultimoPila);
          arquitos = nodoActual.getArcos();
          pila.remove(ultimoPila);
          ultimoPila--;
          nodoActual.fueVisitado();
          recorrido += "-> "+nodoActual.getVertice()+" ";
          
          if(arquitos!=null) {
            for(int i=0; i<arquitos.size(); i++) {
              if(!arquitos.get(i).getDestino().getVisitado()) {              
                ultimoPila++;
                pila.add(arquitos.get(i).getDestino());
              }
            }
          }
        }
      }
      
      return recorrido;
    }
    
 
    @Override
    public String toString() {
        return "Grafo [nodos=" + nodos + ", arcos=" + arcos + "]";
    }
    
}
