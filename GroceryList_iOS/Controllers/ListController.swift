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
    let names = ["Aman", "Kiran", "Azreen","Tanuja"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TableView.delegate = self;
        TableView.dataSource = self;
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
         print("you tapped me")
    }
    
}

extension ListController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell;
    }
}
