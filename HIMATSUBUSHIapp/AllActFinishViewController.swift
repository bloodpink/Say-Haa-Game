//
//  Answer1ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/09/03.
//

import UIKit

class AllActFinishViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
    }
    

    @IBAction func goAnswerCheckPageButton(_ sender: Any) {
        
        performSegue(withIdentifier: "answer", sender: nil)
    }
    
}
