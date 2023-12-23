package restorant;

import java.util.*;
import java.sql.*;


public class Menu {
	Scanner scan = new Scanner(System.in);
	HashMap<Integer, Integer> save_id = new HashMap<Integer, Integer>();
	Integer count = 1;
	
	public void pre() {
		save_id.clear();
		count = 1;
	}
	
	public void display_menu_location(Query query, Employee employee) {
		//print menu tergantung lokasinya
		try {
			ResultSet rs = query.select("menus", "location = '"+  employee.location + "'");
			if(!rs.equals(null))System.out.printf("List " + employee.tipe_resto + " menu :\n");
			while(rs.next()) {
				if(employee.tipe_resto.equals("Special")) {
					System.out.printf("No: %s \n"
							+ "Nama: %s \n"
							+ "Harga : %s\n"
							+ "Narasi : %s\n\n",
									  count,
		            				  rs.getString("nama_makanan"),
		            				  rs.getString("price"),
		                              rs.getString("narasi"));
					
					save_id.put(count, Integer.parseInt(rs.getString("menu_id")));
					count++;
				}else {
					System.out.printf("No: %s \n"
							+ "Nama: %s \n"
							+ "Harga : %s\n"
							+ "Narasi : %s\n"
							+ "Origin : %s\n\n",
								  count,
	            				  rs.getString("nama_makanan"),
	            				  rs.getString("price"),
	                              rs.getString("narasi"),
	                              rs.getString("origin"));
					save_id.put(count, Integer.parseInt(rs.getString("menu_id")));
					count++;
				}
			}
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public void display_menu_general(Query query) {
		//print menu general
		try {
			ResultSet rs = query.select("menus", "location is null");
			if(!rs.equals(null))System.out.printf("List general menu :\n");
			while(rs.next()) {
				System.out.printf("No: %s \n"
						+ "Nama: %s \n"
	            		+ "Harga : %s\n\n",
	            				  count,
	            				  rs.getString("nama_makanan"),
	                              rs.getString("price"));
				save_id.put(count, Integer.parseInt(rs.getString("menu_id")));
				count++;
			}
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public void update_menu(Query query, Employee employee) {
		pre();
		//print semua menu di lokasinya (tidak termasuk menu general)
		System.out.printf("\n\nList menu Restourant " + employee.location + " :\n\n");
		display_menu_location(query, employee);
		
		List<String> coloumns = Arrays.asList("nama_makanan", "price");
		Integer menu_id;
		Integer update_op;
		String new_value;
		
		// pick menu_id untuk di update
		while(true) {
			System.out.printf("enter menu id to update from [1 - %d]\n", count-1);
			menu_id = scan.nextInt(); scan.nextLine();
			if(1 <= menu_id && menu_id < count)break;
		}
		
		//check menu id history transaction
		Integer row = query.size(query.select("menus", " menu_id = "+ menu_id)); 
		if(!row.equals(0)) {
			System.out.println("Menu sudah pernah dipesan sehingga tidak dapat di update");
			return;
		}
		
		// pick colomn untuk di update
		while(true){
			System.out.println("-----Update-----");
	        System.out.println("1. Menu Name");
	        System.out.println("2. Menu Price");
	        update_op = scan.nextInt(); scan.nextLine();
			if(1 == update_op || 2 == update_op)break;
		}
		
		// input value updatenya
		System.out.println("\nnew value :\n");
		new_value = scan.next();
		
		// update
		query.update("menus", coloumns.get(update_op-1), new_value, "menu_id", save_id.get(menu_id));
	}
	
	public void delete_menu(Query query, Employee employee) {
		pre();
		// print semua menu di lokasinya (tidak termasuk menu general)
		System.out.printf("\n\nList menu Restourant " + employee.location + " :\n\n");
		display_menu_location(query, employee);
		
		Integer menu_id;
		// pick menu id
		while(true) {
			System.out.printf("enter menu id to delete from [1 - %d]\n", count-1);
			menu_id = scan.nextInt(); scan.nextLine();
			if(1 <= menu_id && menu_id < count)break;
		}
		
		// check menu id history transaction
		Integer row = query.size(query.select("menus", " menu_id = "+ menu_id)); 
		if(!row.equals(0)) {
			System.out.println("Menu sudah pernah dipesan sehingga tidak dapat di update");
			return;
		}
		
		// delete
		query.delete("menus", "menu_id", save_id.get(menu_id));
	}
	
	public void add_menu(Query query, Employee employee) {
		pre();
		// print semua menu di lokasinya (tidak termasuk menu general)
		List<String> question = Arrays.asList("nama_makanan", "price", "origin", "narasi");
		List<String> new_menu = Arrays.asList("", "", "", "");
		
		System.out.println("-----Add Menu-----");
		for(int i=0; i<4; i++) {
			if(2 == i && employee.tipe_resto.equals("Special"))continue;
			
			System.out.printf("[%s] : \n", question.get(i));
			String inp = scan.nextLine();
			new_menu.set(i, inp);
		}
	
		String columns = "(`nama_makanan`, `price`, `origin`, `narasi`, `location`)";
		String values = "('"+new_menu.get(0)+"', '"+new_menu.get(1)+"', '"+new_menu.get(2)+"', '"+new_menu.get(3)+"', '"+employee.location+"')";
		query.insert("menus", columns, values);
	}
	
}
