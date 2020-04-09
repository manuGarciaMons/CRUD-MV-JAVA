
package ModeloDAO;

import Config.Conexion;
import Intefaces.CRUD;
import Modelo.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO implements CRUD{
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Empleado e = new Empleado();
    
    @Override
    public List listar() {
        ArrayList<Empleado>list=new ArrayList<>();
        String sql="SELECT id, DNI, Nombres, Apellidos, Cargo, Sexo FROM empleados";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Empleado emp=new Empleado();
                emp.setId(rs.getInt("Id"));
                emp.setDni(rs.getString("DNI"));
                emp.setNom(rs.getString("Nombres"));
                emp.setApe(rs.getString("Apellidos"));
                emp.setCar(rs.getString("Cargo"));
                emp.setSex(rs.getString("Sexo"));
                list.add(emp);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Empleado list(int id) {
        String sql="SELECT id, DNI, Nombres, Apellidos, Cargo, Sexo FROM empleados WHERE Id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                e.setId(rs.getInt("Id"));
                e.setDni(rs.getString("DNI"));
                e.setNom(rs.getString("Nombres"));
                e.setApe(rs.getString("Apellidos"));
                e.setCar(rs.getString("Cargo"));
                e.setSex(rs.getString("Sexo"));
                
            }
        } catch (Exception e) {
        }
        return e;
    }

    @Override
    public boolean add(Empleado emp) {
       String sql="INSERT INTO empleados(DNI, Nombres, Apellidos, Cargo, Sexo) "
                + "VALUES ('"+emp.getDni()+"','"+emp.getNom()+"','"+emp.getApe()+
                  "','"+emp.getCar()+"','"+emp.getSex()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(Empleado emp) {
        String sql="UPDATE EMPLEADOS SET DNI='"+emp.getDni()+"',Nombres='"+emp.getNom()+"',Apellidos='"+emp.getApe()+"',Cargo='"+emp.getCar()+"',Sexo='"+emp.getSex()+"'WHERE Id="+emp.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql="DELETE FROM empleados WHERE Id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
