package com.umariana.expocanina;

/**
 *
 * Clase que representa a un perro.
 *
 */
public class Perro {

    private String nombre;
    private String raza;
    private String imagen;
    private int puntos;
    private int edad;

    /**
     * Constructor vacío.
     */
    public Perro() {
    }

    /**
     * Constructor con atributos.
     *
     * @param nombre Nombre del perro.
     * @param raza Raza del perro.
     * @param imagen URL de la imagen del perro.
     * @param puntos Puntuación del perro.
     * @param edad Edad del perro.
     */
    public Perro(String nombre, String raza, String imagen, int puntos, int edad) {
        this.nombre = nombre;
        this.raza = raza;
        this.imagen = imagen;
        this.puntos = puntos;
        this.edad = edad;
    }

    // Métodos getters y setters para los atributos
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
}
