<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*"%>
<%@page import = "ngo.*"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View NGO</title>
    </head>
    <body>
        <jsp:useBean id = "viewer_ngo" class = "ngo.ngo_class" scope = "session"/>
        <%
            int lower_bound, upper_bound;
            if(request.getParameter("lower_bound") != "")
                lower_bound = Integer.valueOf(request.getParameter("lower_bound"));
            else
                lower_bound = -1;
            if(request.getParameter("upper_bound") != "")
                upper_bound = Integer.valueOf(request.getParameter("upper_bound"));
            else
                upper_bound = -1;
            String include_name = request.getParameter("include_name");
            String include_barangay = request.getParameter("include_barangay");
            String include_city = request.getParameter("include_city");
            String include_ngodesc = request.getParameter("include_ngodesc");
            String exclude_name = request.getParameter("exclude_name");
            String exclude_barangay = request.getParameter("exclude_barangay");
            String exclude_city = request.getParameter("exclude_city");
            String exclude_ngodesc = request.getParameter("exclude_ngodesc");
            ArrayList<ArrayList<String>> al_results = viewer_ngo.view_ngo(
                lower_bound, 
                upper_bound, 
                include_name,
                include_barangay,
                include_city,
                include_ngodesc,
                exclude_name,
                exclude_barangay,
                exclude_city,
                exclude_ngodesc
            );
            
        %>
        <%= lower_bound %>|
        <%= upper_bound %>|
        <%= include_name %>|
        <%= include_barangay %>|
        <%= include_city %>|
        <%= include_ngodesc %>|
        <%= exclude_name %>|
        <%= exclude_barangay %>|
        <%= exclude_city %>|
        <%= exclude_ngodesc %>|
        <a href="index.html">Back to Index</a>
    </body>
</html>
