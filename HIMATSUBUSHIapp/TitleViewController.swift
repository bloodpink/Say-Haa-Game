//
//  Haa?1.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/06/26.
//

import UIKit

class TitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
    }

    
    @IBAction func goSettingPageButton(_ sender: Any) {
        performSegue(withIdentifier: "setting", sender:  nil)
    }
    
    

    @IBAction func goExeplanationPageButton(_ sender: Any) {
        performSegue(withIdentifier: "nextExplanation", sender: nil)
    }
    
    



}
