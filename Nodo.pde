import java.util.ArrayList;
import java.util.List;


public class Nodo {
    private String vertice;
    private boolean visitado=false;
    public List<Arco> arcos; 
 
    public Nodo(String vertice) {
        this.vertice = vertice;
    }
 
    public String getVertice() {
        return vertice;
    }
 
    public void setVertice(String vertice) {
        this.vertice = vertice;
    }
 
        public List<Arco> getArcos() {
            return arcos;
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
    
    public void fueVisitado() {
      visitado=true;
    }
    
    
    public boolean getVisitado() {
      return visitado;
    }
 
    @Override
    public String toString() {
        return "\nNodo [vertice=" + vertice + ", arcos=" + arcos + "]";
    }
}
