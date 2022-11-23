/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author christian
 */
public class AlumnoController {
      Computadora[] tablaCompu;
    int indiceArray;
    private ConexionBaseDeDatos conectorBD;
    private Connection conexion;
    private PreparedStatement statement = null;
    private ResultSet result = null;
    
    public AlumnoController(){
        this.tablaCompu = new Computadora[100];
        this.indiceArray=0;
    }
    
     public void guardarAlumno(Computadora compu){
        this.tablaCompu[this.indiceArray]=compu;  
        this.indiceArray=this.indiceArray+1;
        // procedimiento para almacenar en la Base de Datos
    }
    
    public Computadora[] getAlumnos(){
        return this.tablaCompu;
    }
    
    public void abrirConexion(){
        conectorBD= new ConexionBaseDeDatos();
        conexion=conectorBD.conectar();
    }    
   
    
    public String guardarAlumno2(Computadora compu){        
        String sql = "INSERT INTO final_progra.computadora(modelo, tamaño_pantalla, cantidad_ram, almacenamiento, sistema_operativo, marca_codigo) ";
             sql += " VALUES(?,?,?,?,?,?)";              
       try{     
            abrirConexion();
            statement = conexion.prepareStatement(sql); 
            statement.setString(1, compu.getModelo());
            statement.setString(2, compu.getTamañoPantalla());
            statement.setString(3, compu.getCantidadRam());
            statement.setString(4, compu.getAlmacenamiento());
            statement.setString(5, compu.getSistemaOperativo());
            statement.setInt(6, compu.getMarcaCodigo());
                int resultado = statement.executeUpdate(); 
                if(resultado > 0){
                    return String.valueOf(resultado);
                }else{
                    return String.valueOf(resultado);
                }
        }catch(SQLException e){ 
            return e.getMessage();
        }
    }
    
    public void getAlumnos2(StringBuffer respuesta){   
        String sql="select * from final_progra.computadora";
        try{
        abrirConexion();
        
        respuesta.setLength(0); 
        
        statement= conexion.prepareStatement(sql);                        
        result = statement.executeQuery();            
            if (result!=null){
                while (result.next()){
                respuesta.append("<tr>");
                respuesta.append("<td >").append(result.getString("modelo")).append("</td>");
                respuesta.append("<td >").append(result.getString("tamaño_pantalla")).append("</td>");
                respuesta.append("<td >").append(result.getString("cantidad_ram")).append("</td>");
                respuesta.append("<td >").append(result.getString("almacenamiento")).append("</td>");
                respuesta.append("<td >").append(result.getString("sistema_operativo")).append("</td>");
                respuesta.append("<td >").append(result.getString("marca_codigo")).append("</td>");
                respuesta.append("<td id=\"").append(result.getString("modelo"))
                        .append("\"  onclick=\"eliminarAlumno(this.id);\">") 
                         //.append("\"  onclick=\"eliminarAlumno("+result.getString("numero_carne")+");\">") 
                        .append(" <a class=\"btn btn-warning\"'><i class=\"fas fa-edit\"></i>  </a>"
                                +" <a class=\"btn btn-danger\"'> <i class=\"fas fa-trash-alt\"></i> </a>"
                                + " <td></tr>");
                }
            }else{
                respuesta.append("error al consultar");
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    
    public String eliminarALumno(int carne){        
        String sql = "DELETE FROM computadora WHERE modelo="+carne;              
       try{     
            abrirConexion();
            statement = conexion.prepareStatement(sql); 
            int resultado = statement.executeUpdate();
            if(resultado > 0){
                return String.valueOf(resultado);
            }else{
                return String.valueOf(resultado);
            }
        }catch(SQLException e){ 
            return e.getMessage();
        }
    }
    
    
}
