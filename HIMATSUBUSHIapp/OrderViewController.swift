//
//  orderViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/16.
//




import UIKit


//ゲームを進めるプレイヤーの順番を決定する

class OrderViewController: UIViewController {
    
    
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player3NameLabel: UILabel!
    @IBOutlet weak var player4NameLabel: UILabel!
    @IBOutlet weak var player5NameLabel: UILabel!
    @IBOutlet weak var player6NameLabel: UILabel!
    @IBOutlet weak var player7NameLabel: UILabel!
    @IBOutlet weak var player8NameLabel: UILabel!
    
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var sixLabel: UILabel!
    @IBOutlet weak var sevenLabel: UILabel!
    @IBOutlet weak var eightLabel: UILabel!
    

    var playerNameLabelArray = [UILabel]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        GlobalThingsInGame.shared.appendRoundCount += 1

         playerNameLabelArray +=  [player1NameLabel,player2NameLabel,player3NameLabel,player4NameLabel,player5NameLabel,player6NameLabel,player7NameLabel,player8NameLabel]
                

        
        for i in 0 ..< GlobalThingsInGame.shared.playerNameArray.count {
            playerNameLabelArray[i].text = GlobalThingsInGame.shared.playerNameArray[i]
            playerNameLabelArray[i].isUserInteractionEnabled = true
            playerNameLabelArray[i].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(swapTextSingleTapping)))
        }
        
        
         
        player4NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 4
        player5NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 5
        player6NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 6
        player7NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 7
        player8NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 8
        
        
        fourLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 4
        fiveLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 5
        sixLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 6
        sevenLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 7
        eightLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 8
        
        

        
    }

    
    
    @IBAction func randomOrderButton(_ sender: Any) {
        
        GlobalThingsInGame.shared.playerNameArray.shuffle()
        
        for i in 0 ..<  GlobalThingsInGame.shared.playerNameArray.count {
            
            playerNameLabelArray[i].text = GlobalThingsInGame.shared.playerNameArray[i]
            
        }

    }
    
    
    
    @IBAction func goToThemeAnnouncementPageButton(_ sender: Any) {
        
        //後で使う２次元配列の１次元配列をプレイヤー分用意する
        for _ in 0 ..< GlobalThingsInGame.shared.playerNameArray.count {
            
            GlobalThingsInGame.shared.playerAnswerAlphabetArray2D.append([String]())
            
        }
        
        
        //プレイヤーの名前と初期点数「０」をセットする
        for i in GlobalThingsInGame.shared.playerNameArray {
            
            let player = PlayerNameAndPoint(name: "\(i)", point: 0)
            
            GlobalThingsInGame.shared.playerPointNameAndArray2D.append([player])
        }
        
        performSegue(withIdentifier: "themeAnnouncement", sender: nil)
        

        
    }
    
    
    


    //タップしたセルの色によって動作が変わる
    @objc func swapTextSingleTapping(_ sender: UITapGestureRecognizer) {
        
        
        if let label = sender.view as? UILabel {
            
            var playerLabelArray = [player1NameLabel,player2NameLabel,player3NameLabel,player4NameLabel,player5NameLabel,player6NameLabel,player7NameLabel,player8NameLabel]
        
            
            if label.backgroundColor == UIColor.gray {
                
                label.backgroundColor = UIColor.white
                
            } else {
                
                
                label.backgroundColor = UIColor.gray
                
                playerLabelArray.removeAll(where: { $0 == label} )
        
        
                //他にタップしているセル（＝グレーのセル）があればtext交換＆全てのセルカラーを白に。なければタップしたセルを白にする。
                for i in playerLabelArray {
        
                    if i!.backgroundColor == UIColor.gray {
                        
                        swap(&label.text, &i!.text)
                        
                        label.backgroundColor = UIColor.white
                        
                        i?.backgroundColor = UIColor.white
                        
                    }
                }
        
            }
            
        }
    }
    


}



