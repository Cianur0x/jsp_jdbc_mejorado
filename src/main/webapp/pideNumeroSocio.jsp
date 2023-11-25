<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" type="text/css" href="estilos.css" />
  </head>
  <body>
    <%
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root", "giorno");
      Statement s = conexion.createStatement();

      ResultSet listado = s.executeQuery ("SELECT * FROM socio");
    %>
    <table>
      <tr><th>Código</th><th>Nombre</th><th>Estatura</th><th>Edad</th><th>Localidad</th></tr>
    <%
      String claseADestacar = "";
      Integer socioIDADestacar = (Integer)session.getAttribute("socioIDADestacar");
      while (listado.next()) {
      claseADestacar = (socioIDADestacar != null && socioIDADestacar == listado.getInt("socioID")) ? "destacar" : "";
      session.removeAttribute("socioIDADestacar");
    %>
          <tr class="<%=claseADestacar%>"><td>
            <%= listado.getInt("socioID") %></td>
            <td><%= listado.getString("nombre") %></td>
            <td><%= listado.getInt("estatura") %> </td>
            <td><%= listado.getInt("edad") %></td>
            <td><%= listado.getString("localidad") %></td>

      <td>
      <form method="get" action="borraSocio.jsp">
        <input type="hidden" name="codigo" value="<%=listado.getString("socioID") %>"/>
        <input type="submit" value="borrar">
      </form>
      </td></tr>
    <%
      } // while   
      conexion.close();
     %>
    </table>
  </body>
</html>