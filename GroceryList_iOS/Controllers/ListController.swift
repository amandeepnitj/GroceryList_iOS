//
//  ListController.swift
//  GroceryList_iOS
//
//  Created by Amandeep Singh on 2022-04-10.
//

import UIKit

class ListController: UIViewController {

    
    
    @IBOutlet weak var listname: UITextField!
    
    @IBOutlet weak var Amount: UITextField!
    @IBOutlet weak var quantity: UITextField!
    
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var addbuttoon: UIButton!
    @IBOutlet weak var Itemname: UITextField!
    var listarray : [ListModel] = [ListModel]();
    let names = ["Aman", "Kiran", "Azreen","Tanuja"]
    var dbHelper = SQLiteHelper();
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TableView.delegate = self;
        TableView.dataSource = self;
        var a = dbHelper.connect();
        print("db connection == " + (a ? "True":"false"));
        
        a = dbHelper.createTable()
        print("db create table == " + (a ? "True":"false"));
        listarray = dbHelper.getdata(filter: "Sobeys");
    }
    

    @IBAction func addbuttontouched(_ sender: UIButton) {
        
        let list: ListModel = ListModel();
        list.listname = listname.text ?? "List Name";
        list.itemname = Itemname.text ?? "Item Name";
        list.quantity = Int(quantity.text ?? "0") ?? 0;
        list.cost = Double(Amount.text ?? "0.0") ?? 0.0;
        list.bought = 0;
        let p : Bool  = dbHelper.insertData(list: list)
        print(p);
        
//        TableView.reloadData()
//        self.viewDidLoad()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}


extension ListController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped " + listarray[indexPath.row].itemname)
    }
    
}

extension ListController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(listarray.count)
        return listarray.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListViewCell
        cell.Itemname.text = listarray[indexPath.row].itemname;
        cell.quantity.text = String(listarray[indexPath.row].quantity);
        cell.cost.text = String(listarray[indexPath.row].cost);
        
        return cell;
    }
}
