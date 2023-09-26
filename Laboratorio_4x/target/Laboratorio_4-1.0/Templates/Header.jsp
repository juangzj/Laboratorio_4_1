<%-- 
    Document   : ExpoCanina
    Created on : 22/09/2023, 1:13:04 p. m.
    Author     : Juan Goyes, Josue Cardona, Josep Bisbicuz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Exposicion Canina</title>
    </head>
    <body>
        <img src="imagenes/perros.png" alt="Exposicion de perros">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card card-body">
                        <h1>Insertar Perro</h1>
                        <form action="SvPerro" method="POST">
                            <div>
                                <label for="nombre">Nombre:</label>
                                <input type="text" name="nombre">
                            </div>
                            <div>
                                <label for="raza">Raza:</label>
                                <input type="text" name="raza">
                            </div>
                            <div>
                                <label for="imagen">Imagen:</label>
                                <input type="text" name="imagen">
                            </div>
                            <div>
                                <label for="puntos">Puntos:</label>
                                <select name="puntos">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </div>
                            <div>
                                <label for="edad">Edad:</label>
                                <input type="text" name="edad">
                            </div>
                            <input type="submit" value="Insertar perro">
                        </form>
                        <br>
                        <a href="index.jsp">Volver a la página principal</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
