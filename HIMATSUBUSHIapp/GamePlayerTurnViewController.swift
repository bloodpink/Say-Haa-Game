//
//  GamePlayerTurnViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/30.
//

import UIKit


class GamePlayerTurnViewController: UIViewController {

    
    var count = 0
    
    override func viewWillAppear(_ animated: Bool) {
        turnPlayerNameLabel.text = "\(GlobalThingsInGame.shared.playerNameArray[count])さんの番です"
        turnPlayerFinishButton.setTitle("\(GlobalThingsInGame.shared.playerNameArray[count])さんの演技が終了", for: .normal)
        
        if count < GlobalThingsInGame.shared.playerNameArray.count {
            
            count += 1
            
        }
        
        
    }
    

    

    @IBOutlet weak var turnPlayerNameLabel: UILabel! //○さんの番です
    @IBOutlet weak var turnPlayerFinishButton: UIButton! //○さんの演技終了
    
    
    
    //シーンを確認する
    @IBAction func forgetSceneButton(_ sender: Any) {
        performSegue(withIdentifier: "forgetScene", sender: nil)
    }
    
    
    
    //演技が終了
    @IBAction func onePlayerTurnFinishButton(_ sender: UIButton) {
//        performSegue(withIdentifier: "answer", sender: nil)
        performSegue(withIdentifier: "リファクタリング", sender: nil)
    }
    
    
}
