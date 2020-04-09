
package Modelo;

public class Empleado {
    int id;
    String dni;
    String nom;
    String ape;
    String car;
    String sex;

    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }

    public String getCar() {
        return car;
    }

    public void setCar(String car) {
        this.car = car;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Empleado() {
    }

    public Empleado(int id, String dni, String nom, String ape, String car, String sex) {
        this.id = id;
        this.dni = dni;
        this.nom = nom;
        this.ape = ape;
        this.car = car;
        this.sex = sex;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
}
