//
//  ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/06/26.
//

import UIKit

class HomeViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
    }

    
    @IBAction func goTitlePageButton(_ sender: Any) {
        
        performSegue(withIdentifier: "title", sender: nil)
    }
    
    
}

