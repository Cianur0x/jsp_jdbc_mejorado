<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%--
  Created by IntelliJ IDEA.
  User: pika_
  Date: 25/11/2023
  Time: 20:35
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
    int codigo = -1;
    try {
        codigo = Integer.parseInt(request.getParameter("codigo"));
    } catch (NumberFormatException nfe) {
        nfe.printStackTrace();
        valida = false;
    }
    //FIN CÓDIGO DE VALIDACIÓN

    if (valida) {


        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "giorno");

            String sql = "DELETE FROM entrenamientos WHERE entrenamientoID = ?";
            //CREO EL OBJETO PreparedStatement
            ps = conn.prepareStatement(sql);

            ps.setInt(1, codigo);

            //CUANDO EJECUTAS SENTENCIAS DML, INSERT, UPDATE, DELETE SE EMPLEA ps.executeUpdate()
            int filasAfectadas = ps.executeUpdate();

            System.out.println("ENTRENAMIENTOS BORRADOS:  " + filasAfectadas);

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            //BLOQUE FINALLY PARA CERRAR LA CONEXIÓN CON PROTECCIÓN DE try-catch
            try {
                ps.close();
            } catch (Exception e) { /* Ignored */ }
            try {
                conn.close();
            } catch (Exception e) { /* Ignored */ }
        }

    }
%>

<!-- REDIRECCIÓN POR JavaScript EN EL CLIENTE  -->
<script>document.location = "tablaEntrenamientos.jsp"</script>
</body>
</html>
