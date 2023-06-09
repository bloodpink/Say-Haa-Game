//
//  Answer3ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/09/03.
//

import UIKit
import OrderedCollections

class ResultViewController: UIViewController {
    

    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player3NameLabel: UILabel!
    @IBOutlet weak var player4NameLabel: UILabel!
    @IBOutlet weak var player5NameLabel: UILabel!
    @IBOutlet weak var player6NameLabel: UILabel!
    @IBOutlet weak var player7NameLabel: UILabel!
    @IBOutlet weak var player8NameLabel: UILabel!
    
    
    @IBOutlet weak var player1PointLabel: UILabel!
    @IBOutlet weak var player2PointLabel: UILabel!
    @IBOutlet weak var player3PointLabel: UILabel!
    @IBOutlet weak var player4PointLabel: UILabel!
    @IBOutlet weak var player5PointLabel: UILabel!
    @IBOutlet weak var player6PointLabel: UILabel!
    @IBOutlet weak var player7PointLabel: UILabel!
    @IBOutlet weak var player8PointLabel: UILabel!
    
    @IBOutlet weak var rankingCount1: UILabel!
    @IBOutlet weak var rankingCount2: UILabel!
    @IBOutlet weak var rankingCount3: UILabel!
    @IBOutlet weak var rankingCount4: UILabel!
    @IBOutlet weak var rankingCount5: UILabel!
    @IBOutlet weak var rankingCount6: UILabel!
    @IBOutlet weak var rankingCount7: UILabel!
    @IBOutlet weak var rankingCount8: UILabel!
    
    @IBOutlet weak var butttonIBOutlet: UIButton!


    
    @IBAction func goOrBackPageAndResetButton(_ sender: Any) {
        
        //最終ラウンドが終わった時
        if GlobalThingsInGame.shared.appendRoundCount == GlobalThingsInGame.shared.roundConut {
            
            performSegue(withIdentifier: "homeBack", sender: nil)
            
            
            GlobalThingsInGame.shared.count = 0
            GlobalThingsInGame.shared.roundConut = 1
            GlobalThingsInGame.shared.appendRoundCount = 0
            GlobalThingsInGame.shared.allThemeSetArray = [Theme]()
            GlobalThingsInGame.shared.oneSetRandomTheme = nil
            GlobalThingsInGame.shared.pointArray.removeAll()
            GlobalThingsInGame.shared.playerNameArray.removeAll()
            GlobalThingsInGame.shared.oneSetOrderActSceneArray.removeAll()
            GlobalThingsInGame.shared.playerPointNameAndArray2D.removeAll()
            GlobalThingsInGame.shared.playerAnswerAlphabetArray2D.removeAll()
            
            return;
        }
        
        
        
        
        
        //１周毎にやること
        performSegue(withIdentifier: "nextRound", sender: nil)
        
        GlobalThingsInGame.shared.count = 0
        GlobalThingsInGame.shared.appendRoundCount += 1
        GlobalThingsInGame.shared.oneSetRandomTheme = nil
        GlobalThingsInGame.shared.pointArray.removeAll()
        GlobalThingsInGame.shared.oneSetOrderActSceneArray.removeAll()


    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        butttonIBOutlet.titleLabel?.text = "次のお題へ"
        
        
        if GlobalThingsInGame.shared.appendRoundCount == GlobalThingsInGame.shared.roundConut {
            view.backgroundColor = UIColor.init(red: 139, green: 231, blue: 160, alpha: 50)
            
            butttonIBOutlet.titleLabel?.text = "ホーム画面へ戻る"
            
        }
        
        
        //viewのlabelのプレイヤーポイント配列
        let playerPointLabelArray = [player1PointLabel,player2PointLabel,player3PointLabel,player4PointLabel,player5PointLabel,player6PointLabel,player7PointLabel,player8PointLabel]

        let playerNameLabelArray = [player1NameLabel,player2NameLabel,player3NameLabel,player4NameLabel,player5NameLabel,player6NameLabel,player7NameLabel,player8NameLabel]
        
        let rankingCountArray = [rankingCount1,rankingCount2,rankingCount3,rankingCount4,rankingCount5,rankingCount6,rankingCount7,rankingCount8]
        
        
        
        
        
        //各プレイヤーのポイントを１つの配列にまとめる
        for i in 0 ..< GlobalThingsInGame.shared.playerNameArray.count {
            
            GlobalThingsInGame.shared.pointArray.append(GlobalThingsInGame.shared.playerPointNameAndArray2D[i][0].point)
            print("Global.shared.playerPointNameArray[i][0].point:\(GlobalThingsInGame.shared.playerPointNameAndArray2D[i][0].point)")
            
        }
        
        
        
        
        
    
        
        var count = 1
        //貼り付け先
        var countArray = [Int]()
        
        var numToCount : [Int:Int] = [:]
        
        //各ポイントの種類と個数をまとめる
        for i in GlobalThingsInGame.shared.pointArray {
            numToCount[i, default: 0] += 1
        }
        
        //各解答の種類（重複はなし）
        let valueArray = numToCount.keys
        
        //順位をポイント順にするためにsort
        let sortedVlueArray = valueArray.sorted {$0 > $1}
        
        //重複解答の種類と回数（例、１位が2人いれば２位はなく、次は３位になる）
        let duplication = numToCount.filter {(key ,value) in value != 1 }
        
        for i in sortedVlueArray {
            
            countArray.append(count)
            
            let bool = duplication.keys.contains(i)
            
            if bool == true {
                
                let value = duplication[i]! - 1
                
                for _ in 0 ..< value {
                    countArray.append(count)
                }
                count += value
            }
            count += 1
        }
        
        //ポイント順に順位
        for i in 0 ..< GlobalThingsInGame.shared.playerNameArray.count {
            rankingCountArray[i]?.text = String(countArray[i])
        }
        
        
        //ポイント順にポイントラベルに反映
        GlobalThingsInGame.shared.pointArray.sort{$0 > $1}
        for i in 0 ..< GlobalThingsInGame.shared.playerNameArray.count {
            playerPointLabelArray[i]?.text = "\(String(GlobalThingsInGame.shared.pointArray[i]))ポイント"
        }
        
        //直接sortにしてしまうと、２回戦以降、元々決めた演技の順番じゃなくポイント順でポイントが追加されてしまうのでコピーを作る
        let sortplayerPointNameArray = GlobalThingsInGame.shared.playerPointNameAndArray2D.sorted { $0[0].point > $1[0].point }
  
        //ポイント順にプレイヤー名
        for i in 0 ..< GlobalThingsInGame.shared.playerNameArray.count {
            playerNameLabelArray[i]?.text = sortplayerPointNameArray[i][0].name
        }
        
    
        
        
        player4NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 4
        player5NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 5
        player6NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 6
        player7NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 7
        player8NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 8
        
        player4PointLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 4
        player5PointLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 5
        player6PointLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 6
        player7PointLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 7
        player8PointLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 8
        
        rankingCount4.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 4
        rankingCount5.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 5
        rankingCount6.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 6
        rankingCount7.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 7
        rankingCount8.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 8
        

   
    }
    

   
}
