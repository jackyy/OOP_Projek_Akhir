package restorant;
import java.util.*;
import java.sql.*;

public class Update_transaction {
	Scanner scan = new Scanner(System.in);
	public void viewAllTransactions(Query query) {
		System.out.println("== Transactions ==");
		ResultSet rs = query.select("transactions", "1");
		Customer customer = new Customer();
		try {
			while(rs.next()) {
				System.out.println("Transaction ID: " + rs.getInt("transaction_id"));
				System.out.println("Customer name: " + customer.getName(query, rs.getInt("customer_id")));
				System.out.println("Status: " + rs.getString("status"));
				System.out.println("");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void take_order(Query query, Employee employee) {
		boolean update_status;
		Integer transaction_id;
		String status = "";
		System.out.println("== Taking order ==");
		while(true) {
			System.out.printf("Transaction ID: ");
			transaction_id = scan.nextInt();
			ResultSet rs = query.select("transactions", "transaction_id = " + transaction_id);
			try {
				while(rs.next()) {
					status = rs.getString("status");
				}
			} catch (SQLException e) {
				// TODO Auto-genesarated catch block
				e.printStackTrace();
			}
			
			if(status.equals("in_reserve")) {
				update_status = true;
				System.out.println();
				break;
			}
			else if(status.equals("in_order")) {
				update_status = false;
				System.out.println();
				break;
			}
			System.out.println("Invalid transaction ID, please re-input\n");
		}
		
		// display all menus available at employee's restaurant
		Menu menu = new Menu();
		Integer quantity = 0;
		menu.display_all_menu(query, employee);
		while(true) {
			while(true) {
				System.out.printf("No. menu: ");
				menu.id = scan.nextInt();
				if(menu.save_id.containsKey(menu.id)) {
					menu.id = menu.save_id.get(menu.id);
					break;
				}
				System.out.println("No such menu exists, please re-input");
			}
			
			System.out.printf("Quantity: ");
			quantity = scan.nextInt(); scan.nextLine();
			
			ResultSet rs = query.select("orders", "transaction_id = " + transaction_id + " and menu_id = " + menu.id);
			Integer new_quantity = 0;
			// check if the menu is already ordered before, if yes, update the quantity
			try {
				while(rs.next()) {
					new_quantity = rs.getInt("quantity") + quantity;
					query.update("orders", "quantity", Integer.toString(new_quantity), "transaction_id = " + transaction_id + " and menu_id = " + menu.id);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// new menu is ordered, insert to orders table
			if(new_quantity == 0) {
				query.insert("orders", "(`transaction_id`, `menu_id`, `quantity`)", "(" + transaction_id + ", " + menu.id + ", " + quantity + ")");
			}
			
			System.out.println("Add another menu? [y/n]");
			String repeat = scan.nextLine();
			if(repeat.equals("n")){
				// change status from in_reserve to in_order
				if(update_status) query.update("transactions", "status", "'in_order'", "transaction_id = " + transaction_id);
				System.out.println("");
				break;
			}
			System.out.println("");
		}
	}
	
	public void finalize_order(Query query, Employee employee) {
		Menu menu = new Menu();
		// display all menus available at this employee's restaurant
		menu.display_all_menu(query, employee);
		
		// get input which transaction id that is going to be finalized
		// don't forget to validate the transaction status (it must be "in_order")
		
		// from table orders join table menus, display menu name, menu price, menu quantity, menu_price*quantity
		
		// after all of the list above printed, display total price that has to be paid
		
		// finally, in transactions table, change this transaction_id status from "in_order" to "finalized"
	}
	
	
	public void update(Query query, Employee employee) {
		viewAllTransactions(query);
		
		// ask whether to take order or finalize
		Integer choice;
		while(true) {
			System.out.println("== Update transaction ==");
			System.out.println("1. Take order");
			System.out.println("2. Finalize order");
			choice = scan.nextInt();
			if(choice == 1 || choice == 2) break;
			System.out.println("Unknown option, please re-input\n");
		}
		System.out.println("");
		
		if(choice == 1) {
			take_order(query, employee);
		}
		else {
			finalize_order(query, employee);
		}
		
	}
}
