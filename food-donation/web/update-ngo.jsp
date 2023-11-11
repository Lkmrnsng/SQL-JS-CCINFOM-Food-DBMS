<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*"%>
<%@page import = "ngo.*"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Selection</title>
    </head>
    <body>
        <jsp:useBean id = "updater_ngo" class = "ngo.ngo_class" scope = "session"/>
        <h1>Your selection has returned the following value/s: </h1>
        <%
            int ngoid = Integer.valueOf(request.getParameter("ngo_ngoid"));
            ArrayList<String> columns = updater_ngo.get_rows(ngoid);
            if(columns != null && !columns.isEmpty())
            {
        %>
                ID: <%= ngoid %><br>
                Name: <%= columns.get(0) %><br>
                Barangay: <%= columns.get(1) %><br>
                City: <%= columns.get(2) %><br>
                Mobile number: <%= columns.get(3) %><br>
                Description: <%= columns.get(4) %><br>
                <br>
                <form action = "update-values-ngo.jsp">
                    <h1>New Values</h1>
                    ID: <input type = "text" id = "ngo_ngoid" name = "ngo_ngoid" value = <%= ngoid %> readonly><br>
                    Enter new name: <input type = "text" id = "ngo_name" name = "ngo_name"><br>
                    Enter new barangay: <input type = "text" id = "ngo_barangay" name = "ngo_barangay"><br>
                    Enter new city: <input type = "text" id = "ngo_city" name = "ngo_city"><br>
                    Enter new mobile number: <input type = "text" id = "ngo_mobileno" name = "ngo_mobileno"><br>
                    Enter new NGO description (45 characters): <input type = "text" id = "ngo_ngodesc" name = "ngo_ngodesc"><br>
                    <input type = "submit" value = "Submit"><br>
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
