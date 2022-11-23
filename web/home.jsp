<%-- 
    Document   : home
    Created on : 22-oct-2022, 9:11:42
    Author     : Christian
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>PrograII - App Web</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/script.js"></script>
    </head>
    <% 
        response.setHeader("Cache-Control", "nocache, no-store, must-revalidate");
        if(session.getAttribute("user")==null){
            response.sendRedirect("/index.jsp");
        }
    %>
    <body>       
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
              Dropdown
            </a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled">Disabled</a>
          </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
      </div>
    </nav>    
    
    
    <div class="d-flex justify-content-around">
        <div class="p-3 bd-highlight">
        <h1>Modelos de computadoras </h1>
        <a href="NewServlet" > Click aqui </a><br><br>
        <form method="POST" id="form" name="form" action="NewServlet" >
            <div class="form-group">
                <label for="exampleInputName">Modelo</label>
                <input class="form-control" type="text" placeholder="ingresar modelo" name="modelo" id="modelo" >
                <input type="hidden" name="control" value="GUARDAR">
            </div>
            <div class="form-group">
                <label for="exampleInputName">Tamaño pantalla</label>
                <input class="form-control" type="text" placeholder="ingresar tamaño pantalla" name="tamañoPantalla"id="tamañoPantalla" >
            </div>
                <div class="form-group">
                <label for="exampleInputName">Cantidad Ram</label>
                <input class="form-control" type="text" placeholder="ingresar cantidad de ram" name="cantidadRam"id="cantidadRam" >
            </div>
            <div class="form-group">
              <label for="exampleInputName">Almacenamiento</label>
              <input type="text" class="form-control"  name="almacenamiento" id="almacenamiento"  >
            </div>
             <div class="form-group">
              <label for="exampleInputName">Sistema Operativo</label>
              <input type="text" class="form-control"  name="Sistema Operativo" id="sistemaOperativo"  >
            </div>
             <div class="form-group">
              <label for="exampleInputName">Marca codigo</label>
              <input type="text" class="form-control"  name="marca codigo" id="marcaCodigo"  >
            </div>
            <select class="form-control" name="opcion">
                <option value="1">Opción 1</option>
                <option value="2">Opción 2</option>
            </select><br>
            <button type="submit" class="btn btn-primary">Guardar</button>
            <button type="button" onclick="enviarFormularioOpcion2()" class="btn btn-success">Guardar con JS</button>
             <button type="button" class="btn btn-danger">Cancelar</button>
        </form>   
        </div>
       <div class="p-3 bd-highlight">
            <div class="container" id="container2">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <td>Modelo</td>
                            <td>Tamaño Pantalla</td>
                            <td>Cantidad Ram</td>
                            <td>Almacenamiento</td>
                            <td>Sistema Operativo</td>
                            <td>Marca Codigo</td>
                            <td>Tipo</td>
                            <td>Acción</td>
                        </tr>
                    </thead>
                    <tbody id="bodyTable">

                    </tbody>                     
                </table>
            </div>
        </div>
        </div>
                <a href="Logout" class="btn btn-danger">Cerrar Sesion - ${UsuarioLogueado} </a>
    </body>
</html>
