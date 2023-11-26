<%--
  Created by IntelliJ IDEA.
  User: fernandaalbacura
  Date: 24/11/23
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h2>Introduzca los datos del nuevo socio:</h2>
<form method="post" action="grabaEntrenamiento.jsp">
    Nº Entrenamiento <input type="text" name="numero"/></br>
    Tipo Entrenamiento <input type="text" name="tipo"/></br>
    Ubicación <input type="text" name="ubicacion"/></br>
    Fecha <input type="date"  name="fecha" />
    <input type="submit" value="Aceptar">
</form>
<%
    // Se revida si hay algun emensaje de error y se carga en un span
    String mensaje = (String)session.getAttribute("error");
    if (mensaje != null) {
%>
<span style=" background-color: crimson; color: yellow; font-weight: bold"><%=mensaje %></span>
<%
        // para que no se queden los errores cargados en la sesion hay que borrarlos
        session.removeAttribute("error");
    }
%>
</body>
</html>
