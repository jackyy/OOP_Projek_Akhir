package restorant;
import java.util.*;
import java.sql.*;

public class Customer {
	String name;
	Integer id;
	
	public String getName(Query query, Integer customer_id) {
		ResultSet rs = query.select("customers", "customer_id = " + customer_id);
		try {
			while(rs.next()) {
				return rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
}
