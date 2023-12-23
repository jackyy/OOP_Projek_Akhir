package restorant;
import java.util.*;
import java.sql.*;


public class Main {
	Scanner scan = new Scanner(System.in);
	Menu menu = new Menu();
	
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
        		 break;
        		 
             }else if(inp.equals(2)) {
            	 menu.update_menu(query, employee);
            	 break;
            	 
             }else if(inp.equals(3)) {
            	 menu.delete_menu(query, employee);
            	 break;
            	 
             }else if(inp.equals(4)) {
            	 break;
             }else if(inp.equals(5)) {
            	 break;
            	 
             }else if(inp.equals(6)) {
            	 //keluar
            	 break;
             }
        }
        
    }


    public void Update_Transaction() {
/*
        print transaction yang sesuai dengan lokasi

        input transaction id

        kalo posisinya status
        reserve -> in order
        in order -> finalized
        minta konfirmasi terlebih dahulu untuk perubahan status

        1. status reserve -> order
        tugas butuh add order
        print menu yang ada
            input id_menu
            input quantitiy
            add order parameter -> [transaction id, menu id, quatity]

            masih lanjut makanan [y/n] no keluar, yes input lagi

        2. status in order -> finalized
        print total harga
        finalize
*/
    }
    public void Add_Transaction(){
/*
        input type (reservation or order)
        input customer name
        input table quantitiy
        input table type
        input human per table

        validasi apakah human per table > max table type. no lanjut, iya input ulang

        add transaction reservation parameter [employye_id, customer_name, table_quantity, table_type, human_per_table ]

        jika typenya itu order lakuin no 1 di update


*/
    }
	
}

