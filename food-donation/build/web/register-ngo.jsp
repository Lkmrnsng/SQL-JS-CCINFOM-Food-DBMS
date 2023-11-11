<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*"%>
<%@page import = "ngo.*"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NGO Registration Processing</title>
    </head>
    <body>
        <jsp:useBean id = "new_ngo" class = "ngo.ngo_class" scope = "session"/>
        <%
            new_ngo.name = request.getParameter("ngo_name");
            new_ngo.barangay = request.getParameter("ngo_barangay");
            new_ngo.city = request.getParameter("ngo_city");
            new_ngo.mobileno = request.getParameter("ngo_mobileno");
            new_ngo.ngodesc = request.getParameter("ngo_ngodesc");
            int status = new_ngo.register_ngo();
            if(status == 1)
            {
        %>
            <h1>NGO Registration Successful</h1>
        <%
            }
            else
            {    
        %>
            <h1>NGO Registration Unsuccessful</h1>
        <%
            }
        %>
        <a href="index.html">Back to Index</a>
    </body>
</html>
