<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*"%>
<%@page import = "ngo.*"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search NGO Results</title>
    </head>
    
        <jsp:useBean id = "search_ngo" class = "ngo.ngo_class" scope = "session"/>
        <%
            String keyword = request.getParameter("keyword");
            ArrayList<ArrayList<String>> name_results = search_ngo.search_by_column("name", keyword);
            ArrayList<ArrayList<String>> barangay_results = search_ngo.search_by_column("barangay", keyword);
            ArrayList<ArrayList<String>> city_results = search_ngo.search_by_column("city", keyword);
            ArrayList<ArrayList<String>> mobileno_results = search_ngo.search_by_column("mobileno", keyword);
            ArrayList<ArrayList<String>> ngodesc_results = search_ngo.search_by_column("ngodesc", keyword);
        %>
        <h1>Keyword: <%= keyword %></h1>
        <h1>By name</h1>
        <%
            for(int i = 0; i < name_results.get(0).size(); i++)
            {
        %>
                <%= name_results.get(0).get(i) + " |" %>
                <%= name_results.get(1).get(i) + " |" %>
                <%= name_results.get(2).get(i) + " |" %>
                <%= name_results.get(3).get(i) + " |" %>
                <%= name_results.get(4).get(i) + " |" %>
                <%= name_results.get(5).get(i) + " |" %>
                <br>
        <%
            }
        %>
        <h1>By barangay</h1>
        <%
            for(int i = 0; i < barangay_results.get(0).size(); i++)
            {
        %>
                <%= barangay_results.get(0).get(i) + " |" %>
                <%= barangay_results.get(1).get(i) + " |" %>
                <%= barangay_results.get(2).get(i) + " |" %>
                <%= barangay_results.get(3).get(i) + " |" %>
                <%= barangay_results.get(4).get(i) + " |" %>
                <%= barangay_results.get(5).get(i) + " |" %>
                <br>
        <%
            }
        %>
        <h1>By city</h1>
        <%
            for(int i = 0; i < city_results.get(0).size(); i++)
            {
        %>
                <%= city_results.get(0).get(i) + " |" %>
                <%= city_results.get(1).get(i) + " |" %>
                <%= city_results.get(2).get(i) + " |" %>
                <%= city_results.get(3).get(i) + " |" %>
                <%= city_results.get(4).get(i) + " |" %>
                <%= city_results.get(5).get(i) + " |" %>
                <br>
        <%
            }
        %>
        <h1>By mobile number</h1>
        <%
            for(int i = 0; i < mobileno_results.get(0).size(); i++)
            {
        %>
                <%= mobileno_results.get(0).get(i) + " |" %>
                <%= mobileno_results.get(1).get(i) + " |" %>
                <%= mobileno_results.get(2).get(i) + " |" %>
                <%= mobileno_results.get(3).get(i) + " |" %>
                <%= mobileno_results.get(4).get(i) + " |" %>
                <%= mobileno_results.get(5).get(i) + " |" %>
                <br>
        <%
            }
        %>
        <h1>By description</h1>
        <%
            for(int i = 0; i < ngodesc_results.get(0).size(); i++)
            {
        %>
                <%= ngodesc_results.get(0).get(i) + " |" %>
                <%= ngodesc_results.get(1).get(i) + " |" %>
                <%= ngodesc_results.get(2).get(i) + " |" %>
                <%= ngodesc_results.get(3).get(i) + " |" %>
                <%= ngodesc_results.get(4).get(i) + " |" %>
                <%= ngodesc_results.get(5).get(i) + " |" %>
                <br>
        <%
            }
        %>
        <a href="index.html">Back to Index</a>
</html>
