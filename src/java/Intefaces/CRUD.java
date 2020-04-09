
package Intefaces;

import Modelo.Empleado;
import java.util.List;


public interface CRUD {
    public List listar();
    public Empleado list(int id);
    public boolean add(Empleado per);
    public boolean edit(Empleado per);
    public boolean eliminar(int id);
}
