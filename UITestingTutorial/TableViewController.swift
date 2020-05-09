//
//  TablieTableViewController.swift
//  UITestingTutorial
//
//  Created by Code Pro on 9/14/18.
//  Copyright © 2018 Code Pro. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var downloadsCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mockify Music"
        
        downloadsCell.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(userLoggedIn), name: Notification.Name("loggedIn"), object: nil)
    }
    
    @objc func userLoggedIn(){
        print("method called")
        
        if UserDefaults.standard.bool(forKey: "loggedIn") {
                   downloadsCell.isHidden = false
               } else {
                   downloadsCell.isHidden = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.bool(forKey: "loggedIn") {
            downloadsCell.isHidden = false
        } else {
            downloadsCell.isHidden = true
        }
    }
    
    @IBAction func showLogin(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "loggedIn")
        if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            present(loginVC, animated: true, completion: nil)
        }
    }
}
