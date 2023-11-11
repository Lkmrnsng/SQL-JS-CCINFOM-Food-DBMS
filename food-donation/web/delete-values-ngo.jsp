<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*"%>
<%@page import = "ngo.*"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Processing</title>
    </head>
    <body>
        <jsp:useBean id = "deleter_ngo" class = "ngo.ngo_class" scope = "session"/>
        <%
            int id = Integer.valueOf(request.getParameter("ngo_ngoid"));
            String name = request.getParameter("ngo_name");
            String city = request.getParameter("ngo_barangay");
            String barangay = request.getParameter("ngo_city");
            String mobileno = request.getParameter("ngo_mobileno");
            String description = request.getParameter("ngo_ngodesc");
            int status = deleter_ngo.delete_ngo(id, name, city, barangay, mobileno, description);
            if(status == 1)
            {
        %>
            <h1>Delete Successful</h1>
        <%
            }
            else
            {    
        %>
            <h1>Delete Unsuccessful</h1>
        <%
            }
        %>
        <a href="index.html">Back to Index</a>
    </body>
</html>
