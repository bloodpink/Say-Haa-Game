//
//  ForgetSceneViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/30.
//

import UIKit

class ForgetSceneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        ThemeLabel.text = "お題：\(GlobalThingsInGame.shared.oneSetRandomTheme.theme)"
        subThemeLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.subTheme
        aSceneLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.a
        bSceneLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.b
        cSceneLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.c
        dSceneLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.d
        eSceneLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.e
        fSceneLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.f
        gSceneLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.g
        hSceneLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.h
        
       

    }
    
    @IBOutlet weak var ThemeLabel: UILabel!
    @IBOutlet weak var subThemeLabel: UILabel!
    @IBOutlet weak var aSceneLabel: UILabel!
    @IBOutlet weak var bSceneLabel: UILabel!
    @IBOutlet weak var cSceneLabel: UILabel!
    @IBOutlet weak var dSceneLabel: UILabel!
    @IBOutlet weak var eSceneLabel: UILabel!
    @IBOutlet weak var fSceneLabel: UILabel!
    @IBOutlet weak var gSceneLabel: UILabel!
    @IBOutlet weak var hSceneLabel: UILabel!
    var count = 0
    
    



    //アラートを出して自分のボタンを選ばせる。ボタンのテキストを「確認したら戻る」に戻す
    @IBAction func myPlayerSceneCheckButton(_ sender: Any) {

            
        let alertController = UIAlertController(title: "自分のシーンを忘れてしまった方へ", message: "確認したいプレイヤー名を選択してください", preferredStyle: .alert)
        
        
        
        
        let player1Button = UIAlertAction(title: "\(GlobalThingsInGame.shared.playerNameArray[0])", style: .default) { alertController2 in
            let alertController2 = UIAlertController(title: "\(GlobalThingsInGame.shared.playerNameArray[0])さんは以下のシーンです", message: "\(GlobalThingsInGame.shared.oneSetOrderActSceneArray[0])", preferredStyle: .actionSheet)
                
                let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                alertController2.addAction(backButton)
                self.present(alertController2, animated: true, completion: nil)
                }
        
        
        
        let player2Button = UIAlertAction(title: "\(GlobalThingsInGame.shared.playerNameArray[1])", style: .default) { alertController2 in
            let alertController2 = UIAlertController(title: "\(GlobalThingsInGame.shared.playerNameArray[1])さんは以下のシーンです", message: "\(GlobalThingsInGame.shared.oneSetOrderActSceneArray[1])", preferredStyle: .actionSheet)
                
                let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                alertController2.addAction(backButton)
                self.present(alertController2, animated: true, completion: nil)
                }
        
        
        
        let player3Button = UIAlertAction(title: "\(GlobalThingsInGame.shared.playerNameArray[2])", style: .default) { alertController2 in
            let alertController2 = UIAlertController(title: "\(GlobalThingsInGame.shared.playerNameArray[2])さんは以下のシーンです", message: "\(GlobalThingsInGame.shared.oneSetOrderActSceneArray[2])", preferredStyle: .actionSheet)
                
                let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                alertController2.addAction(backButton)
                self.present(alertController2, animated: true, completion: nil)
                }
        
        
        
        
        
        
        if 4 <= GlobalThingsInGame.shared.playerNameArray.count {
            print("Global.shared.globalPlayerArray:\(GlobalThingsInGame.shared.playerNameArray)")
            let player4Button = UIAlertAction(title: "\(GlobalThingsInGame.shared.playerNameArray[3])", style: .default) { alertController2 in
                let alertController2 = UIAlertController(title: "\(GlobalThingsInGame.shared.playerNameArray[3])さんは以下のシーンです", message: "\(GlobalThingsInGame.shared.oneSetOrderActSceneArray[3])", preferredStyle: .actionSheet)
                    
                    let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                    alertController2.addAction(backButton)
                    self.present(alertController2, animated: true, completion: nil)
                    }
            
            alertController.addAction(player4Button)
            
            
            
            
            
            
            
            if 5 <= GlobalThingsInGame.shared.playerNameArray.count {
                
                let player5Button = UIAlertAction(title: "\(GlobalThingsInGame.shared.playerNameArray[4])", style: .default) { alertController2 in
                    let alertController2 = UIAlertController(title: "\(GlobalThingsInGame.shared.playerNameArray[4])さんは以下のシーンです", message: "\(GlobalThingsInGame.shared.oneSetOrderActSceneArray[4])", preferredStyle: .actionSheet)
                        
                        let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                        alertController2.addAction(backButton)
                        self.present(alertController2, animated: true, completion: nil)
                    
                }
                
                alertController.addAction(player5Button)
                
                
                
                
                
                
                if 6 <= GlobalThingsInGame.shared.playerNameArray.count {
                    
                    let player6Button = UIAlertAction(title: "\(GlobalThingsInGame.shared.playerNameArray[5])", style: .default) { alertController2 in
                        let alertController2 = UIAlertController(title: "\(GlobalThingsInGame.shared.playerNameArray[5])さんは以下のシーンです", message: "\(GlobalThingsInGame.shared.oneSetOrderActSceneArray[5])", preferredStyle: .actionSheet)
                            
                            let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                            alertController2.addAction(backButton)
                            self.present(alertController2, animated: true, completion: nil)
                            }
                    
                    alertController.addAction(player6Button)
                    
                    
                    
                    
                    
                    
                    if 7 <= GlobalThingsInGame.shared.playerNameArray.count {
                        
                        let player7Button = UIAlertAction(title: "\(GlobalThingsInGame.shared.playerNameArray[6])", style: .default) { alertController2 in
                            let alertController2 = UIAlertController(title: "\(GlobalThingsInGame.shared.playerNameArray[6])さんは以下のシーンです", message: "\(GlobalThingsInGame.shared.oneSetOrderActSceneArray[6])", preferredStyle: .actionSheet)
                                
                                let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                                alertController2.addAction(backButton)
                                self.present(alertController2, animated: true, completion: nil)
                                }
                        
                        alertController.addAction(player7Button)
                        
                        
                        
                        
                        
                        
                        if 8 <= GlobalThingsInGame.shared.playerNameArray.count {
                            
                            let player8Button = UIAlertAction(title: "\(GlobalThingsInGame.shared.playerNameArray[7])", style: .default) { alertController2 in
                                let alertController2 = UIAlertController(title: "\(GlobalThingsInGame.shared.playerNameArray[7])さんは以下のシーンです", message: "\(GlobalThingsInGame.shared.oneSetOrderActSceneArray[7])", preferredStyle: .actionSheet)
                                    
                                    let backButton = UIAlertAction(title: "確認しました", style: .default, handler: nil)
                                    alertController2.addAction(backButton)
                                    self.present(alertController2, animated: true, completion: nil)
                                    }
                            
                            alertController.addAction(player8Button)
                            
                        }
                    }
                }
            }
        }
        
        
        
        alertController.addAction(player1Button)
        alertController.addAction(player2Button)
        alertController.addAction(player3Button)
        
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    


}



