<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Socio</title>
</head>
<body>

<%
    //CÓDIGO DE VALIDACIÓN
    boolean valida = true;
    int codigo = -1;
    try {
        codigo = Integer.parseInt(request.getParameter("socioID"));
    } catch (NumberFormatException nfe) {
        nfe.printStackTrace();
        valida = false;
    }
    //FIN CÓDIGO DE VALIDACIÓN

    if (valida) {


        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {


            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "user", "1234");

            String sql = "SELECT * FROM socio WHERE socioID = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, codigo);

            rs = ps.executeQuery();

            if (rs.next()) {
                int numSocio = rs.getInt("socioID");
                String nombre = rs.getString("nombre");
                int estatura = rs.getInt("estatura");
                int edad = rs.getInt("edad");
                String localidad = rs.getString("localidad");
%>
<table>
    <tr>
        <th><%="Numero socio" %>
        </th>

        <th><%="Nombre" %>
        </th>

        <th><%="Estatura" %>
        </th>

        <th><%="Edad" %>
        </th>
        <th><%="Localidad" %>
        </th>
    </tr>
    <tr>
        <td><%=numSocio%>
        </td>
        <td><%=nombre%>
        </td>
        <td><%=estatura%>
        </td>
        <td><%=edad%>
        </td>
        <td><%=localidad%>
        </td>

    </tr>

</table>
<a href="index.jsp">Home</a>
<%
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            //BLOQUE FINALLY PARA CERRAR LA CONEXIÓN CON PROTECCIÓN DE try-catch
            //SIEMPRE HAY QUE CERRAR LOS ELEMENTOS DE LA  CONEXIÓN DESPUÉS DE UTILIZARLOS
            //try { rs.close(); } catch (Exception e) { /* Ignored */ }
            try {
                ps.close();
            } catch (Exception e) { /* Ignored */ }
            try {
                conn.close();
            } catch (Exception e) { /* Ignored */ }
        }

    }
%>


</body>
</html>
