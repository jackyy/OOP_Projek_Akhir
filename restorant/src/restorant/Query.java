package restorant;

import java.util.*;
import java.sql.*;

public class Query {
	Connection conn = null;
	
	public ResultSet select(String table, String condition) {
		ResultSet rs = null;
		
		try {
	        Statement stmt = conn.createStatement();
	        rs = stmt.executeQuery("select * "
	        		+ " from "+ table
	        		+ " where " + condition);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return rs;
	}
	
	public void update(String table, String column_value, String new_value, String column_id, Integer id) {
		try {
			String s = "update " + table 
					+ " set "+ column_value + " = '"+new_value+"' where " +column_id + " = '"+id+"' ";
			PreparedStatement pst = conn.prepareStatement(s);
            
            int check = pst.executeUpdate();
            
            if (check != 0) {
                System.out.println("Data successfully Update!");
            } else {
                System.out.println("Update failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
    public void delete(String table, String column_id, Integer id) {
        try {
            PreparedStatement pst = conn.prepareStatement("delete from "+table+" where "+column_id+" = "+id);

            
            int check = pst.executeUpdate();
            if (check != 0) {
                System.out.println("Data successfully Deleted!");
            } else {
                System.out.println("Insert Deleted");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
    public void insert(String table, String column, String value) {
        try {
//        	String x = "insert into "+ table + column + " values " + value;
            PreparedStatement pst = conn.prepareStatement("insert into "+ table + " " + column + " values " + value);
            int check = pst.executeUpdate();
            if (check != 0) {
                System.out.println("Data successfully inserted!");
            } else {
                System.out.println("Insert failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
	public Integer size(ResultSet rs) {
		Integer ct = 0;
		try {
			while(rs.next()) {
				ct++;
			}
		} catch (Exception e) {
            e.printStackTrace();
        }
		return ct;
	}
	
	public Query() {
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant", "root", "");
           
            if (conn != null) {
                System.out.println("Connection established!");
            } else {
                System.out.println("Failed to connect");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
