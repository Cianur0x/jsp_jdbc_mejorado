<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="estilos.css">
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
    <span class="error_msj"><%=mensaje %></span>
    <%
            // para que no se queden los errores cargados en la sesion hay que borrarlos
        session.removeAttribute("error");
    }
    %>
  </body>
</html>