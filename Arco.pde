class Arco{
    private Nodo origen;
    private Nodo destino;
    private double distancia;
 
    public Arco(Nodo origen, Nodo destino, double distancia) {
        this.origen = origen;
        this.destino = destino;
        this.distancia = distancia;
    }
 
    public Arco(Nodo origen, Nodo destino) {
        this.origen = origen;
        this.destino = destino;
    }
    
    public Nodo getOrigen() {
        return origen;
    }
 
    public void setOrigen(Nodo origen) {
        this.origen = origen;
    }
 
    public Nodo getDestino() {
        return destino;
    }
 
    public void setDestino(Nodo destino) {
        this.destino = destino;
    }
 
    public double getDistancia() {
        return distancia;
    }
 
    public void setDistancia(double distancia) {
        this.distancia = distancia;
    }
 
    @Override
    public String toString() {
        return "\n \tArco [origen=" + origen.getVertice() + ", destino=" + destino.getVertice() + "]";
    }
}
