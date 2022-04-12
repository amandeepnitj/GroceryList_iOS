//
//  ViewController.swift
//  GroceryList_iOS
//
//  Created by Amandeep Singh on 2022-04-10.
//

import UIKit

class HomeController: UIViewController {

    
    @IBOutlet weak var Ads: UIView!
    
    @IBOutlet weak var Createbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        Createbutton.addTarget(self, action: #selector(clickcreatebutton), for: .touchUpInside)
    }
    
    @objc func clickcreatebutton()
    {
        let story  = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "ListController") as! ListController
        let navigationcontroller  = UINavigationController(rootViewController: controller);
        self.present(navigationcontroller, animated: true, completion: nil)
    }

}

