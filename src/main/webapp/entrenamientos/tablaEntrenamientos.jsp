<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: pika_
  Date: 25/11/2023
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../estilos.css" />
</head>
<body>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root", "giorno");
    Statement s = conexion.createStatement();

    ResultSet listado = s.executeQuery ("SELECT * FROM entrenamiento");
%>
<table>
    <tr>
        <th>Código</th>
        <th>Tipo</th>
        <th>Ubicación</th>
        <th>Fecha</th>
    </tr>
    <%
      // Se destaca el nuevo entrenamiento insertado
      String claseADestacar = "";
      Integer nuevoEntrenamiento = (Integer)session.getAttribute("nuevoEntrenamiento");
      // Se imprime la tabla de entrenamientos
      while (listado.next()) {
      claseADestacar = (nuevoEntrenamiento != null && nuevoEntrenamiento == listado.getInt("entrenamientoID")) ? "destacar" : "";
      session.removeAttribute("nuevoEntrenamiento");
    %>
    <tr class="<%=claseADestacar%>">
        <td><%= listado.getInt("entrenamientoID") %></td>
        <td><%= listado.getString("tipo_entrenamiento") %></td>
        <td><%= listado.getString("ubicacion") %></td>
        <td><%= listado.getDate("fecha_realizacion") %></td>
        <td>
            <form method="get" action="borraEntrenamiento.jsp">
                <input type="hidden" name="codigo" value="<%= listado.getInt("entrenamientoID") %>"/>
                <input type="submit" value="borrar" id="borrarBtn">
            </form>
        </td>
    </tr>
        <%
      }
      // se cierra la conexión a la base de datos
      conexion.close();
     %>
</body>
</html>
