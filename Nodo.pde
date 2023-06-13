import java.util.ArrayList;
import java.util.List;


public class Nodo {
    private int[] cuboEstado = new int[27];
    private boolean visitado=false;
    public List<Arco> arcos; 
 
    public Nodo(Cubo nodoCubo) {
        this.cuboEstado = nodoCubo.getPosition();
    }
 
    public int[] getEstado() {
        return cuboEstado;
    }
 
    public void setEstado(Cubo nodoCubo) {
        this.cuboEstado = nodoCubo.getPosition();
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
      String nodo = "";
      
      for(int i = 0; i<27; i++){
        nodo += "\nNodo [vertice "+i+"= " + cuboEstado[i] + ", arcos=" + arcos + "]";
      }
      
        return nodo;
    }
}
