package table;
import java.util.*;

import query.Query;

import java.sql.*;

public class Table {
	public String table_type;
	public Integer num_of_people;
	public boolean check_table(Query query) {
		ResultSet rs = query.select("tables", "table_type = '" + this.table_type +"'");
		boolean error = false;
		if(query.size(rs) == 0) {
			System.out.println("Unknown table type");
			error = true;
		}
		else {
			try {
				rs = query.select("tables", "table_type = '" + this.table_type +"'");
				while(rs.next()) {
					if(this.num_of_people > rs.getInt("maximum_people")) {
						System.out.println("The number of people exceeds table capacity (max. " + rs.getInt("maximum_people") + ")");
						error = true;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				error = true;
				e.printStackTrace();
			}
		}
		return error;
	}
	
	public void show_table(Query query, Integer transaction_id) {
		ResultSet rs = query.select("tables", "transaction_id = " + transaction_id);
		try {
			while(rs.next()) {
				System.out.println("Table type: " + this.table_type);
				System.out.println("Number of people: " + this.num_of_people);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
