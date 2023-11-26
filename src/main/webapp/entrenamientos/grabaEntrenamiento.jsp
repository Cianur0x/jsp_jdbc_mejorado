<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.UUID" %><%--
  Created by IntelliJ IDEA.
  User: pika_
  Date: 25/11/2023
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //CÓDIGO DE VALIDACIÓN
    boolean valida = true;
    int numEntrenamiento = -1;
    String tipo = null;
    String ubicacion = null;
    String fecha = null;

    // Flags para saber que parametro se ha validado
    boolean flagValidaNumeroID = false;
    boolean flagValidaTipoNull = false;
    boolean flagValidaTipoBlank = false;
    boolean flagValidaUbicacionNull = false;
    boolean flagValidaUbicacionBlank = false;
    boolean flagValidaFechaNull = false;
    boolean flagValidaFechaBlank = false;


    try {
        // Se comprueba numero
        numEntrenamiento = Integer.parseInt(request.getParameter("numero"));
        flagValidaNumeroID = true;

        // Se comprueba tipo
        Objects.requireNonNull(request.getParameter("tipo"));
        flagValidaTipoNull = true;
        if (request.getParameter("tipo").isBlank())
            throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        tipo = request.getParameter("tipo");
        flagValidaTipoBlank = true;

        // Se comprueba ubicación
        Objects.requireNonNull(request.getParameter("ubicacion"));
        flagValidaUbicacionNull = true;

        if (request.getParameter("ubicacion").isBlank())
            throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        flagValidaUbicacionBlank = true;
        ubicacion = request.getParameter("ubicacion");

        // Se comprueba la fecha
        Objects.requireNonNull(request.getParameter("fecha"));
        flagValidaFechaNull = true;

        if (request.getParameter("fecha").isBlank())
            throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        flagValidaFechaBlank = true;
        fecha = request.getParameter("fecha");

    } catch (Exception ex) {
        ex.printStackTrace();
        valida = false;
        // Crear un atributo nuevo en session llamado 'error'
        // para que luego podamos avisar donde ha fallado el formulario
        if (!flagValidaNumeroID) {
            session.setAttribute("error", "Error en campo Numero");
        } else if (!flagValidaTipoNull || !flagValidaTipoBlank) {
            session.setAttribute("error", "Error en campo Nombre");
        } else if (!flagValidaUbicacionNull || !flagValidaUbicacionBlank) {
            session.setAttribute("error", "Error en campo Localidad");
        } else if (!flagValidaFechaNull || !flagValidaFechaBlank) {
            session.setAttribute("error", "Error en campo Localidad");
        } else {
            session.setAttribute("bien", "Todo bien");
        }
    }

    //FIN CÓDIGO DE VALIDACIÓN

    if (valida) {

        Connection conn = null;
        PreparedStatement ps = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "giorno");

            String sql = "INSERT INTO entrenamientos VALUES ( " +
                    "?, " +
                    "?, " +
                    "?, " +
                    "?)";

            // Se insertan los nuevos datos en la tabla
            ps = conn.prepareStatement(sql);
            int idx = 1;
            // post incremento
            ps.setInt(idx++, numEntrenamiento);
            ps.setString(idx++, tipo);
            ps.setString(idx++, ubicacion);
            ps.setString(idx++, fecha);

            int filasAfectadas = ps.executeUpdate();
            System.out.println("ENTRENAMIENTO GRABADO:  " + filasAfectadas);


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            // Se cierra la conexión a la base de datos y se cierra el PreparedStatement
            try {
                ps.close();
            } catch (Exception e) { /* Ignored */ }
            try {
                conn.close();
            } catch (Exception e) { /* Ignored */ }
        }

        // Se va a tablaEntreanmientos para ver todos los entrenamientos insertados
        // y se destaca el entrenamiento que se acaba de insertar
        session.setAttribute("nuevoEntrenamiento", numEntrenamiento);
        response.sendRedirect("tablaEntrenamientos.jsp");

    } else {
        // Si no se validan los datos se se enviara de vuelta al formulario
        response.sendRedirect("formularioEntrenamiento.jsp");
    }

%>
<h1><%=request.getParameter("fecha")%>
</h1>
</body>
</html>
