<%@page import="java.util.ArrayList"%>
<%@page import="com.umariana.expocanina.Perro"%>
<!DOCTYPE html>
<%@include file="Templates/Header.jsp" %>


<img src="imagenes/perros.png" class="img-fluid" alt="Exposicion de perros">
<div class="container p-4">
    <div class="row">
        <div class="col-md-4">
            <div class="card card-body">
                <!--Titulo insertar perro-->
                <h1>Insertar Perro</h1>
                <form action="SvPerro" method="POST" enctype="multipart/form-data">
                    <!--Entrada nombre perro-->
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre:</label>
                        <input type="text" name="nombre" class="form-control">
                    </div>
                    <!--Entraqda raza perro-->
                    <div class="mb-3">
                        <label for="raza" class="form-label">Raza:</label>
                        <input type="text" name="raza" class="form-control">
                    </div>
                    <!--Imagen perro-->
                    <div class="mb-3">
                        <label for="imagen" class="form-label">Imagen:</label>
                        <input type="file" name="imagen" class="form-control">
                    </div>
                    <!--Puntos perro-->
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
                    <!--Edad perro-->
                    <div class="mb-3">
                        <label for="edad" class="form-label">Edad:</label>
                        <input type="text" name="edad" class="form-control">
                    </div>
                    <input class="btn btn-success" type="submit" value="Insertar perro">
                </form>
                <br>
                <!--Boton volver-->
                <a href="index.jsp">Volver a la página principal</a>
            </div>
        </div>
        <!--Encabezado de tabla-->
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
                            <!--Iconos-->
                            <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre="<%= n.getNombre()%>"><i class="fas fa-eye"></i></a> <!--ver -->
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
<!-- ventana modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Información Perro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="n-details">
                    <!-- Aqui se mostraran los detalles del perro -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
<script>
    // funcion para mostrar los datos en la ventana modal
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Botón que desencadenó el evento
        var nombre = button.data('nombre'); // Obtén el nombre del perro

        // Realiza una solicitud AJAX al servlet para obtener los detalles del perro por su nombre
        $.ajax({
            url: 'SvPerro?nombre=' + nombre, // Cambia 'id' por el nombre del parámetro que esperas en tu servlet
            method: 'GET',
            success: function (data) {
                // Actualiza el contenido del modal con los detalles del perro
                $('#n-details').html(data);
            },
            error: function () {
                // Maneja errores aquí si es necesario
                console.log('Error al cargar los detalles del perro.');
            }
        });
    });

</script>
<%@include file="Templates/Footer.jsp" %>