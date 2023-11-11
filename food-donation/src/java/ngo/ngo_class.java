package ngo;
import java.util.*;
import java.sql.*;

public class ngo_class 
{
    public String name;
    public String barangay;
    public String city;
    public String mobileno;
    public String ngodesc;
    
    public ngo_class() {}
    
    public int register_ngo()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection; 
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddonation?user=root&password=12345678");
            
            PreparedStatement statement = connection.prepareStatement(
                "INSERT INTO ngo (name, barangay, city, mobileno, ngodesc) VALUES (?, ?, ?, ?, ?);"
            );
            statement.setString(1, name);
            statement.setString(2, barangay);
            statement.setString(3, city);
            statement.setString(4, mobileno);
            statement.setString(5, ngodesc);
            statement.executeUpdate();
            
            statement.close();
            connection.close();
        }
        catch(Exception e)
        {
            System.out.println("Error: " + e.getMessage());
            return -1;
        }
        
        return 1;
    }
    
    public ArrayList<String> get_rows(int ngoid)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection; 
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddonation?user=root&password=12345678");
            
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM ngo WHERE ngoid = " + ngoid);
            ResultSet results = statement.executeQuery();
            ArrayList<String> columns = new ArrayList<>();
            while(results.next())
            {
                columns.add(results.getString("name"));
                columns.add(results.getString("barangay"));
                columns.add(results.getString("city"));
                columns.add(results.getString("mobileno"));
                columns.add(results.getString("ngodesc"));
            }
            statement.close();
            connection.close();
            return columns;
        }
        catch(Exception e)
        {
            System.out.println("Error: " + e.getMessage());
        }
        
        return null;
    }
    
    public int update_ngo(int ngoid, String name, String barangay, String city, String mobileno, String ngodesc)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection; 
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddonation?user=root&password=12345678");
            
            PreparedStatement statement = connection.prepareStatement(
                "UPDATE ngo SET name = ?, barangay = ?, city = ?, mobileno = ?, ngodesc = ? WHERE ngoid = ?;"
            );
            statement.setString(1, name);
            statement.setString(2, barangay);
            statement.setString(3, city);
            statement.setString(4, mobileno);
            statement.setString(5, ngodesc);        
            statement.setString(6, String.valueOf(ngoid));
            statement.executeUpdate();
            statement.close();
            connection.close();
        }
        catch(Exception e)
        {
            System.out.println("Error: " + e.getMessage());
            return -1;
        }
        
        return 1;
    }
    
    public int delete_ngo(int ngoid, String name, String barangay, String city, String mobileno, String ngodesc)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection; 
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddonation?user=root&password=12345678");
            
            PreparedStatement statement = connection.prepareStatement(
                "DELETE FROM ngo WHERE ngoid = ? AND name = ? AND barangay = ? AND city = ? AND mobileno = ? AND ngodesc = ?;"
            );
            statement.setString(1, String.valueOf(ngoid));
            statement.setString(2, name);
            statement.setString(3, barangay);
            statement.setString(4, city);
            statement.setString(5, mobileno);
            statement.setString(6, ngodesc);        
            statement.executeUpdate();
            statement.close();
            connection.close();
        }
        catch(Exception e)
        {
            System.out.println("Error: " + e.getMessage());
            return -1;
        }
        
        return 1;
    }
    
    public ArrayList<ArrayList<String>> search_by_column(String column, String keyword)
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection; 
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddonation?user=root&password=12345678");
            
            PreparedStatement statement = connection.prepareStatement(
                "SELECT * FROM ngo WHERE " + column + " LIKE \'%" + keyword + "%\';"
            );
            ResultSet results = statement.executeQuery();
            
            ArrayList<ArrayList<String>> al_results = new ArrayList<>();
            for(int i = 0; i < 6; i++)
                al_results.add(new ArrayList<>());
            while(results.next())
            {
                al_results.get(0).add(results.getString("ngoid"));
                al_results.get(1).add(results.getString("name"));
                al_results.get(2).add(results.getString("barangay"));
                al_results.get(3).add(results.getString("city"));
                al_results.get(4).add(results.getString("mobileno"));
                al_results.get(5).add(results.getString("ngodesc"));
            }
            
            results.close();
            statement.close();
            connection.close();
            return al_results;
        }
        catch(Exception e)
        {
            System.out.println("Error: " + e.getMessage());
        }
        
        return null;
    }
    
    public ArrayList<ArrayList<String>> view_ngo(
        int lower_bound, 
        int upper_bound, 
        String include_name,
        String include_barangay,
        String include_city,
        String include_ngodesc,
        String exclude_name,
        String exclude_barangay,
        String exclude_city,
        String exclude_ngodesc
    )
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection; 
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddonation?user=root&password=12345678");
            String sql_statement = "SELECT * FROM ngo WHERE ";
            
            if(lower_bound > 0 && upper_bound > 0)
                sql_statement += "ngoid >= " + lower_bound + " AND ngoid <= " + upper_bound + " AND ";
            if(!include_name.equals(""))
                sql_statement += "name LIKE \'%" + include_name + "%\' AND ";
            if(!include_barangay.equals(""))
                sql_statement += "barangay LIKE \'%" + include_barangay + "%\' AND ";
            if(!include_city.equals(""))
                sql_statement += "city LIKE \'%" + include_city + "%\' AND ";
            if(!include_ngodesc.equals(""))
                sql_statement += "ngodesc LIKE \'%" + include_ngodesc + "%\' AND ";
            if(!exclude_name.equals(""))
                sql_statement += "name NOT LIKE \'%" + exclude_name + "%\' AND ";
            if(!exclude_barangay.equals(""))
                sql_statement += "barangay NOT LIKE \'%" + exclude_barangay + "%\' AND ";
            if(!exclude_city.equals(""))
                sql_statement += "city NOT LIKE \'%" + exclude_city + "%\' AND ";
            if(!exclude_ngodesc.equals(""))
                sql_statement += "ngodesc NOT LIKE \'%" + exclude_ngodesc + "%\' AND ";
            sql_statement = sql_statement.substring(0, sql_statement.length() - 5);
            sql_statement += ";";
            System.out.println(sql_statement);
            
            PreparedStatement statement = connection.prepareStatement(sql_statement);
            ResultSet results = statement.executeQuery();
            
            ArrayList<ArrayList<String>> al_results = new ArrayList<>();
            for(int i = 0; i < 6; i++)
                al_results.add(new ArrayList<String>());
            while(results.next())
            {
                al_results.get(0).add(results.getString("ngoid"));
                al_results.get(1).add(results.getString("name"));
                al_results.get(2).add(results.getString("barangay"));
                al_results.get(3).add(results.getString("city"));
                al_results.get(4).add(results.getString("mobileno"));
                al_results.get(5).add(results.getString("ngodesc"));
            }
            
            results.close();
            statement.close();
            connection.close();
            return al_results;
        }
        catch(Exception e)
        {
            System.out.println("Error: " + e.getMessage());
        }
        
        return null;
    }
    
    public static void main(String args[])
    {
        
        ngo_class test_ngo = new ngo_class();
        ArrayList<ArrayList<String>> al_results = test_ngo.view_ngo(-1, -1, "aid", "", "", "", "swift", "", "", "");
        for(int i = 0; i < al_results.get(0).size(); i++)
        {
            System.out.println(al_results.get(0).get(i));
        }
        /*
        ArrayList<ArrayList<String>> al_results = test_ngo.search_by_column("name", "aid");
        /*
        for(int i = 0; i < al_results.get(0).size(); i++)
        {
            System.out.println(al_results.get(0).get(i));
        }
        */
    }
}
