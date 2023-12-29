package transaction;
import java.util.*;

import customer.Customer;
import employee.Employee;
import query.Query;
import table.Table;

import java.sql.*;

public class New_transaction {
	Scanner scan = new Scanner(System.in);
	
	public void make_reservation(Query query, Employee employee) {
		Integer num_of_table;
		Integer transaction_id = null;
		Customer customer = new Customer();
		Table table = new Table();
		
		System.out.printf("Customer name: ");
		customer.name = scan.nextLine();
		
		// insert into customers table
		query.insert("customers", "(`name`, `location`)", "('" + customer.name + "', '" + employee.location + "')");
		// get customer id from customers table
		ResultSet rs = query.getLastData("customers", "customer_id");
		try {
			while(rs.next())
				customer.id = rs.getInt("customer_id");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.printf("Number of tables reserved: ");
		num_of_table = scan.nextInt(); scan.nextLine();
		
		for(int i=0; i<num_of_table; i++) {
			System.out.printf("== Table %d ==\n", i+1);
			
			while(true) {
				System.out.printf("Table type: ");
				table.table_type = scan.nextLine();
				
				System.out.printf("Number of people: ");
				table.num_of_people = scan.nextInt(); scan.nextLine();
				if(!table.check_table(query)) break;
			}
			query.insert("transactions", "(`customer_id`, `employee_id`, `status`)", "(" + customer.id + ", " + employee.id + ", 'in_reserve')");
			// get this transaction id from transactions table
			rs = query.getLastData("transactions", "transaction_id");
			try {
				while(rs.next()) transaction_id = rs.getInt("transaction_id");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			query.insert("table_info", "(`transaction_id`, `table_type`, `human_per_table`)", "(" + transaction_id + ", '" + table.table_type + "', " + table.num_of_people + ")");
		}
		System.out.println("Reservation for customer " + customer.name + " has been made");
	}
}
