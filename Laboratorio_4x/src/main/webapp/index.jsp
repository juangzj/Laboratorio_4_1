<%@page import="java.util.ArrayList"%>
<%@page import="com.umariana.expocanina.Perro"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Exposicion Canina</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="../Estilos/estilo.css"/>
    </head>
    <body>
        <img src="imagenes/perros.png" class="img-fluid" alt="Exposicion de perros">
        <div class="container p-4">
            <div class="row">
                <div class="col-md-4">
                    <div class="card card-body">
                        <h1>Insertar Perro</h1>
                        <form action="SvPerro" method="POST">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre:</label>
                                <input type="text" name="nombre" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="raza" class="form-label">Raza:</label>
                                <input type="text" name="raza" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="imagen" class="form-label">Imagen:</label>
                                <input type="text" name="imagen" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="puntos" class="form-label">Puntos:</label>
                                <select name="puntos" class="form-select">
                                    <option selected>Seleccione...</option>
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
                            <div class="mb-3">
                                <label for="edad" class="form-label">Edad:</label>
                                <input type="text" name="edad" class="form-control">
                            </div>
                            <input class="btn btn-success" type="submit" value="Insertar perro">
                        </form>
                        <br>
                        <a href="index.jsp">Volver a la página principal</a>
                    </div>
                </div>
                <div class="col-md-8">
                    <h1>Listado de Perros</h1>
                    <table class="table table-bordered table-dark">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Raza</th>
                                <th>Foto</th>
                                <th>Puntos</th>
                                <th>Edad</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Obtener los datos de perro
                                ArrayList<Perro> misPerros = (ArrayList<Perro>) request.getAttribute("misPerros");

                                // Verificar si misPerros no es nulo
                                if (misPerros != null) {
                                    // Recorre los perros y los muestra
                                    for (Perro n : misPerros) {
                            %>
                            <tr>
                                <td><%=n.getNombre()%></td>
                                <td><%=n.getRaza()%></td>
                                <td><%=n.getImagen()%></td>
                                <td><%=n.getPuntos()%></td>
                                <td><%=n.getEdad()%></td>
                                <td>
                                    <i class="ti ti-eye"></i> <!--ver -->
                                    <i class="ti ti-pencil"></i> <!--editar -->
                                    <i class="ti ti-trash"></i> <!--borrar -->
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>