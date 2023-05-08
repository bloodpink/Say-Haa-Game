//
//  Haa3ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/16.
//


import UIKit

class CheackViewController : UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true


        deciededRoundCountLabel.text = "\(GlobalThingsInGame.shared.roundConut)回"
        
        deciededRoundCountLabel.adjustsFontSizeToFitWidth = true
        
        
        let playerLabelArray = [player1NameLabel,player2NameLabel,player3NameLabel,player4NameLabel,player5NameLabel,player6NameLabel,player7NameLabel,player8NameLabel]
        
        
        for i in 0 ..< GlobalThingsInGame.shared.playerNameArray.count {
            
            playerLabelArray[i]?.text = GlobalThingsInGame.shared.playerNameArray[i]
            
        }
        
        
        player4NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 4
        player5NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 5
        player6NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 6
        player7NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 7
        player8NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 8
        
    }
    

    @IBOutlet weak var deciededRoundCountLabel: UILabel!
    
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player3NameLabel: UILabel!
    @IBOutlet weak var player4NameLabel: UILabel!
    @IBOutlet weak var player5NameLabel: UILabel!
    @IBOutlet weak var player6NameLabel: UILabel!
    @IBOutlet weak var player7NameLabel: UILabel!
    @IBOutlet weak var player8NameLabel: UILabel!
    
    
    
    
    
    //画面遷移
    @IBAction func orderNextBurron(_ sender: Any) {

        

        
        
        performSegue(withIdentifier: "order", sender: nil)
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
        GlobalThingsInGame.shared.playerNameArray.removeAll()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
}

