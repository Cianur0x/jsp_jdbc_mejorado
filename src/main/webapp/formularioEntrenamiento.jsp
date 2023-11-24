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
<form method="get" action="grabaSocio.jsp">
    Nº socio <input type="text" name="numero"/></br>
    Nombre <input type="text" name="nombre"/></br>
    Estatura <input type="text" name="estatura"/></br>
    Edad <input type="text" name="edad"/></br>
    Localidad <input type="text" name="localidad"/></br>
    <input type="submit" value="Aceptar">
</form>
<%
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
