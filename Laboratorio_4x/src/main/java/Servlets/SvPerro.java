package Servlets;

import com.umariana.expocanina.Perro;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "SvPerro", urlPatterns = {"/SvPerro"})
@MultipartConfig
public class SvPerro extends HttpServlet {

    ArrayList<Perro> misPerros = new ArrayList<>();

    /**
     * Metodo para buscar al perro por el nombre
     *
     * @param nombre
     * @return
     */
    private Perro buscarPerroPorNombre(String nombre) {
        for (Perro perro : misPerros) {
            if (perro.getNombre().equals(nombre)) {
                return perro; // Retorna el perro
            }
        }
        return null; // Retorna null si no se encuentra el perro
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        Perro perro = buscarPerroPorNombre(nombre);
        if (perro != null) {
            // Genera la respuesta HTML con los detalles del perro
            String perroHtml = "<h2>Nombre: " + perro.getNombre() + "</h2>"
                    + "<p>Raza: " + perro.getRaza() + "</p>"
                    + "<p>Puntos: " + perro.getPuntos() + "</p>"
                    + "<p>Edad: " + perro.getEdad() + "</p>"
                    + "<img src='imagenes/" + perro.getImagen() + "' alt='" + perro.getNombre() + "' width='100%'/>";
            response.setContentType("text/html");
            response.getWriter().write(perroHtml);
        } else {
            // Maneja el caso en el que no se encuentra el perro
            response.setContentType("text/plain");
            response.getWriter().write("Perro no encontrado");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener la parte del archivo      
        Part imagenPart = request.getPart("imagen");
        System.out.println("imagenPart" + imagenPart);

        // Nombre original del archivo
        String fileName = imagenPart.getSubmittedFileName();
        System.out.println("fileName: " + fileName);

        // Directorio donde se almacenara el archivo
        String uploadDirectory = getServletContext().getRealPath("imagenes");
        System.out.println("uploadDirectory: " + uploadDirectory);

        //Ruta completa del archivo
        String filePath = uploadDirectory + File.separator + fileName;
        System.out.println("filePath: " + filePath);

        //Guardar el archivo en el sistema de archivos
        try (InputStream input = imagenPart.getInputStream(); OutputStream output = new FileOutputStream(filePath)) {

            byte[] buffer = new byte[1024];
            int length;
            while ((length = input.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
        }

        // Obtener los datos ingresados por el usuario en el formulario
        String nombre = request.getParameter("nombre");
        String raza = request.getParameter("raza");
        String imagen = fileName;
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
            }
        }
        if (edadStr != null && !edadStr.isEmpty()) {
            try {
                edad = Integer.parseInt(edadStr);
            } catch (NumberFormatException e) {
                // Manejo de error en caso de que no se pueda convertir a int
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
