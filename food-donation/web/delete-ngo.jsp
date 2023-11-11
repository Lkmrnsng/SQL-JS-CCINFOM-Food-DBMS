<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*"%>
<%@page import = "ngo.*"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Selection</title>
    </head>
    <body>
        <jsp:useBean id = "deleter_ngo" class = "ngo.ngo_class" scope = "session"/>
        <h1>Your selection has returned the following value/s: </h1>
        <%
            int ngoid = Integer.valueOf(request.getParameter("ngo_ngoid"));
            ArrayList<String> columns = deleter_ngo.get_rows(ngoid);
            if(columns != null && !columns.isEmpty())
            {
        %>
            <form action = "delete-values-ngo.jsp">
                ID: <input type = "text" id = "ngo_ngoid" name = "ngo_ngoid" value = <%= ngoid %> readonly><br>
                Name: <input type = "text" id = "ngo_name" name = "ngo_name" value = <%= columns.get(0) %> readonly><br>
                Barangay: <input type = "text" id = "ngo_barangay" name = "ngo_barangay" value = <%= columns.get(1) %> readonly><br>
                City: <input type = "text" id = "ngo_city" name = "ngo_city" value = <%= columns.get(2) %> readonly><br>
                Mobile number: <input type = "text" id = "ngo_mobileno" name = "ngo_mobileno" value = <%= columns.get(3) %> readonly><br>
                Description: <input type = "text" id = "ngo_ngodesc" name = "ngo_ngodesc" value = <%= columns.get(4) %> readonly><br>
                <br>
                <input type = "submit" value = "Delete"><br>
            </form>
        <%     
            }
                else
            {   
        %>
                 No results <br>
        <%  }%>
        <a href="index.html">Back to Index</a>
    </body>
</html>
