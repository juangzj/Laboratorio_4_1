package Servlets;

import com.umariana.expocanina.Perro;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvPerro", urlPatterns = {"/SvPerro"})
public class SvPerro extends HttpServlet {

    ArrayList<Perro> misPerros = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los datos ingresados por el usuario en el formulario
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        String imagen = request.getParameter("imagen");
        String puntosStr = request.getParameter("puntos"); // Cambiar a String
        String edadStr = request.getParameter("edad");     // Cambiar a String

        // Verificar si los campos numéricos no están vacíos antes de convertir
        int puntos = 0;
        int edad = 0;
        if (puntosStr != null && !puntosStr.isEmpty()) {
            try {
                puntos = Integer.parseInt(puntosStr);
            } catch (NumberFormatException e) {
                // Manejo de error en caso de que no se pueda convertir a int
                // Puedes mostrar un mensaje de error o realizar alguna acción aquí
            }
        }
        if (edadStr != null && !edadStr.isEmpty()) {
            try {
                edad = Integer.parseInt(edadStr);
            } catch (NumberFormatException e) {
                // Manejo de error en caso de que no se pueda convertir a int
                // Puedes mostrar un mensaje de error o realizar alguna acción aquí
            }
        }

        // Crear un nuevo objeto Perro
        Perro miPerro = new Perro(nombre, raza, imagen, puntos, edad);

        // Añadir el nuevo registro al array
        misPerros.add(miPerro);

        // Agregar el ArrayList al objeto de solicitud como atributo
        request.setAttribute("misPerros", misPerros);

        // Redireccionar a la página principal (index.jsp)
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
