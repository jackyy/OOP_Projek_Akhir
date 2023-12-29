package employee;

import java.util.*;

import query.Query;

import java.sql.*;


public class Employee {
	public Integer id;
	public String nama;
	public String location;
	public String tipe_resto;
	
	public void show_employee(Query query) {
		try {
			ResultSet rs = query.select("employees", "true");
	        while (rs.next()) {
	        	System.out.printf("Employee_id : %s\n"
	            		+ "Nama: %s \n"
	            		+ "Location : %s\n\n",
	            				  rs.getString("employee_id"),
	                              rs.getString("name"), 
	                              rs.getString("location"));
	        }
	        
	        System.out.println();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public Boolean check_data(Integer id, Query query) {
		Integer ct = 0;
		try {
	        ResultSet rs = query.select("employees", "employee_id = "+ id);
	        
	        while (rs.next()) {
	        	ct++;
	        	this.id = id;
	        	this.nama = rs.getString("name");
	        	this.location = rs.getString("location");
	        	
	        	if(this.location.equals("Bandung") ||this.location.equals("Jakarta") || this.location.equals("Bali")) {
	        		this.tipe_resto = "Special";
	        	}else {
	        		this.tipe_resto = "Local";
	        	}
	        }
	        
	        System.out.println();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
		if(ct.equals(1))return true;
		return false;
	}
	
    public Employee(Query query) {
    	System.out.println("Choparang exists");
    	Scanner scan = new Scanner(System.in);
        System.out.println();
        System.out.println("-----Employee-----");
        show_employee(query);
        while(true) {
        	System.out.println("Insert your employee id:");
            Integer id = scan.nextInt(); scan.nextLine();
           
            if(check_data(id, query).equals(true)) {
            	System.out.println("Employee id enter succesfully");
            	break;
            }
            System.out.println("Unknown employee id. Please re-input");
        }
        
        return;
    }
	
}
