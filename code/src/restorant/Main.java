package restorant;
import java.util.*;

import employee.Employee;
import menu.Menu;
import query.Query;
import transaction.New_transaction;
import transaction.Update_transaction;

import java.sql.*;


public class Main {
	Scanner scan = new Scanner(System.in);
	Menu menu = new Menu();
	New_transaction new_transaction = new New_transaction();
	Update_transaction update_transaction = new Update_transaction();
	
	public static void main(String[] args) {
		Query query = new Query();
		new Main(query);
	}
	
	public Main(Query query) {
        Employee employee = new Employee(query);

        while(true) {
        	System.out.println();
            System.out.println("-----do something-----");
            System.out.println("1. Add Menu");
            System.out.println("2. Update Menu");
            System.out.println("3. Delete Menu");
            System.out.println("4. Add Transaction (new customer)");
            System.out.println("5. Update Transaction");
            System.out.println("6. Exit");
        	System.out.println("enter number from [1-6]");
            Integer inp = scan.nextInt(); scan.nextLine();
            
        	 if(inp.equals(1)) {
        		 menu.add_menu(query, employee);
             }else if(inp.equals(2)) {
            	 menu.update_menu(query, employee);
             }else if(inp.equals(3)) {
            	 menu.delete_menu(query, employee);
             }else if(inp.equals(4)) {
            	 new_transaction.make_reservation(query, employee);
             }else if(inp.equals(5)) {
            	 update_transaction.update(query, employee);
            	 
             }else if(inp.equals(6)) {
            	 System.out.println("Arigatouu~~");
            	 System.exit(0);;
             }
        }
        
    }
	
}

