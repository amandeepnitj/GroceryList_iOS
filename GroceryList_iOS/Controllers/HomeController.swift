//
//  ViewController.swift
//  GroceryList_iOS
//
//  Created by Amandeep Singh on 2022-04-10.
//

import UIKit

class HomeController: UIViewController {

    
    
    @IBOutlet weak var Createbutton: UIButton!
    
    @IBOutlet weak var HometableView: UITableView!
    var arrayoflist : [String]=[String]();
    var dbHelper = SQLiteHelper();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        Createbutton.addTarget(self, action: #selector(clickcreatebutton), for: .touchUpInside)
        
        HometableView.delegate = self;
        HometableView.dataSource = self;
        
        
        var a = dbHelper.connect();
        print("db connection == " + (a ? "True":"false"));
        
        a = dbHelper.createTable()
        print("db create table == " + (a ? "True":"false"));
        arrayoflist = dbHelper.getlistnames();
    }
    
    @objc func clickcreatebutton()
    {
        let story  = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "ListController") as! ListController
        let navigationcontroller  = UINavigationController(rootViewController: controller);
        self.present(navigationcontroller, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "viewlistsegue")
        {
            let indexPath = self.HometableView.indexPathForSelectedRow!
            
            let viewlistController = segue.destination as! ViewListController;
            viewlistController.mylistname = arrayoflist[indexPath.row];
            
        }
    }

}




extension HomeController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped");
        self.performSegue(withIdentifier: "viewlistsegue", sender: self)
    }
}

extension HomeController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayoflist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = HometableView.dequeueReusableCell(withIdentifier: "Homecell", for: indexPath) as! HomeViewCell;
        cell.listname_home.text = arrayoflist[indexPath.row]
        
        return cell
    }
}

