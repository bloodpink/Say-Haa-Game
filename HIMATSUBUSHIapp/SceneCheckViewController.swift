//
//  PlayerSceneCheckViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/28.
//

import UIKit
import OrderedCollections

//１ラウンド毎のテーマを決定し、各メンバーに公開
class SceneCheckViewController: UIViewController {
    
    @IBOutlet weak var playerSceneLabel: UILabel!
    @IBOutlet weak var sceneLabel: UILabel!
    @IBOutlet weak var desuLabel: UILabel!
    @IBOutlet weak var turnPlayerSceneCheckButton: UIButton!
    @IBOutlet weak var turnPlayerSceneCheckButtonIB: UIButton!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        sceneLabel.adjustsFontSizeToFitWidth = true
        
        playerSceneLabel.isHidden = true
        sceneLabel.isHidden = true
        desuLabel.isHidden = true
 

        
        
        GlobalThingsInGame.shared.oneSetOrderActSceneArray.append(GlobalThingsInGame.shared.oneSetRandomTheme.a)
        GlobalThingsInGame.shared.oneSetOrderActSceneArray.append(GlobalThingsInGame.shared.oneSetRandomTheme.b)
        GlobalThingsInGame.shared.oneSetOrderActSceneArray.append(GlobalThingsInGame.shared.oneSetRandomTheme.c)
        GlobalThingsInGame.shared.oneSetOrderActSceneArray.append(GlobalThingsInGame.shared.oneSetRandomTheme.d)
        GlobalThingsInGame.shared.oneSetOrderActSceneArray.append(GlobalThingsInGame.shared.oneSetRandomTheme.e)
        GlobalThingsInGame.shared.oneSetOrderActSceneArray.append(GlobalThingsInGame.shared.oneSetRandomTheme.f)
        GlobalThingsInGame.shared.oneSetOrderActSceneArray.append(GlobalThingsInGame.shared.oneSetRandomTheme.g)
        GlobalThingsInGame.shared.oneSetOrderActSceneArray.append(GlobalThingsInGame.shared.oneSetRandomTheme.h)
        
        GlobalThingsInGame.shared.oneSetOrderActSceneArray.shuffle()
        
        

        
        labelChange()
        
    }
    

    
    
    
    
    //シーン確認ボタン
    @IBAction func sceneCheckButton(_ sender: Any) {
        
        playerSceneLabel.isHidden = false
        sceneLabel.isHidden = false
        desuLabel.isHidden = false
        
        turnPlayerSceneCheckButtonIB.isHidden = true
        
    }
    

    
    
    
    
    var count = 0
    
    //シーン確認後、次のプレイヤーに交代するボタン
    @IBAction func nextPlayerSceneCheckButton(_ sender: Any) {
        
        turnPlayerSceneCheckButtonIB.isHidden = false
        playerSceneLabel.isHidden = true
        sceneLabel.isHidden = true
        desuLabel.isHidden = true
        
        
        count += 1
        
        if count < GlobalThingsInGame.shared.playerNameArray.count {
            
        labelChange()
        
        }
        
        
        //最後のプレイヤーまで回ったら画面遷移
        if count == GlobalThingsInGame.shared.playerNameArray.count {
            
            performSegue(withIdentifier:"gamePlayerTurn",sender:nil)
            
        }
        

    }
    
    
    
    //「○さんは」＋「シーン」+「ボタンのタイトル」
    func labelChange() {
        playerSceneLabel.text = "\(GlobalThingsInGame.shared.playerNameArray[count])さんは"
        sceneLabel.text = "\(GlobalThingsInGame.shared.oneSetOrderActSceneArray[count])"
        turnPlayerSceneCheckButton.titleLabel?.text = "\(GlobalThingsInGame.shared.playerNameArray[count])さんの\nシーンを確認する"
    }


}
