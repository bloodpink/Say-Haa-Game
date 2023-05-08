//
//  answer2ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/09/03.
//

import UIKit

class AnswerCheckViewController: UIViewController {
  


    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        aThemeLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.a
        bThemeLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.b
        cThemeLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.c
        dThemeLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.d
        eThemeLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.e
        fThemeLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.f
        gThemeLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.g
        hThemeLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme.h
        
        player4NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 4
        player5NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 5
        player6NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 6
        player7NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 7
        player8NameLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 8
        
        player4AnswerLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 4
        player5AnswerLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 5
        player6AnswerLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 6
        player7AnswerLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 7
        player8AnswerLabel.isHidden = GlobalThingsInGame.shared.playerNameArray.count < 8
        
        
        self.navigationItem.hidesBackButton = true
        
        nextButtonLabel.titleLabel?.text = "次のシーンの結果へ"
        roundLabel.text = "第\(GlobalThingsInGame.shared.roundConut)回戦　お題：\(GlobalThingsInGame.shared.oneSetRandomTheme.theme)"
        
        
        let nameArray = [player1NameLabel,player2NameLabel,player3NameLabel,player4NameLabel,player5NameLabel,player6NameLabel,player7NameLabel,player8NameLabel]
        
  
        //プレイヤー名ラベル反映
        for i in 0 ..< GlobalThingsInGame.shared.playerNameArray.count {
            
            nameArray[i]?.text = GlobalThingsInGame.shared.playerNameArray[i]
            
        }
        
        
        //回答者の回答のアルファベットと、出題者の正解のアルファベットを順に配列に格納
        for i in 0 ..< GlobalThingsInGame.shared.playerAnswerAlphabetArray2D.count {
            
            let firstString = GlobalThingsInGame.shared.oneSetOrderActSceneArray[i].prefix(1)

            GlobalThingsInGame.shared.playerAnswerAlphabetArray2D[i].insert(String(firstString), at: i)
        }
        
        
        
        answerLabelChange()

    }
    
    
    


    @IBOutlet weak var aThemeLabel: UILabel!
    @IBOutlet weak var bThemeLabel: UILabel!
    @IBOutlet weak var cThemeLabel: UILabel!
    @IBOutlet weak var dThemeLabel: UILabel!
    @IBOutlet weak var eThemeLabel: UILabel!
    @IBOutlet weak var fThemeLabel: UILabel!
    @IBOutlet weak var gThemeLabel: UILabel!
    @IBOutlet weak var hThemeLabel: UILabel!
    
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var player3NameLabel: UILabel!
    @IBOutlet weak var player4NameLabel: UILabel!
    @IBOutlet weak var player5NameLabel: UILabel!
    @IBOutlet weak var player6NameLabel: UILabel!
    @IBOutlet weak var player7NameLabel: UILabel!
    @IBOutlet weak var player8NameLabel: UILabel!
    
    @IBOutlet weak var player1AnswerLabel: UILabel!
    @IBOutlet weak var player2AnswerLabel: UILabel!
    @IBOutlet weak var player3AnswerLabel: UILabel!
    @IBOutlet weak var player4AnswerLabel: UILabel!
    @IBOutlet weak var player5AnswerLabel: UILabel!
    @IBOutlet weak var player6AnswerLabel: UILabel!
    @IBOutlet weak var player7AnswerLabel: UILabel!
    @IBOutlet weak var player8AnswerLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    
    
    
    
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        count += 1
        
        //最後の出題者の番になったら
        if count == GlobalThingsInGame.shared.playerNameArray.count - 1{
            
            //最終ラウンドなら
            if GlobalThingsInGame.shared.appendRoundCount == GlobalThingsInGame.shared.roundConut {
                nextButtonLabel.setTitle("全ラウンド終了！次へ！", for: .normal)
            //最終ラウンドじゃないなら
            } else {
                nextButtonLabel.setTitle("現在の順位へすすむ", for: .normal)
            }
        }

        
        goToNextPage()
        
        //Index out of rangeエラー防止
        if count < GlobalThingsInGame.shared.playerNameArray.count {
            answerLabelChange()
        }
        
    }
    
    
    
    
    
    var count = 0
    
    
    func goToNextPage() {
        
        
        
        //全員の結果を見たら画面遷移
        if count == GlobalThingsInGame.shared.playerNameArray.count{
            
            GlobalThingsInGame.shared.count = 0
            
            //更に最終ラウンドだったら最後の画面へ
            if GlobalThingsInGame.shared.appendRoundCount == GlobalThingsInGame.shared.roundConut {
                
                print("final")
                
                performSegue(withIdentifier: "finallyResult", sender: nil)
                return;
            }
            
            performSegue(withIdentifier: "rank", sender: nil)
            return;
        }
        
    }
    
    
    
    
    
    
    func answerLabelChange () {
            
        
        
        var answerPlayerLabelArray = [player1AnswerLabel,player2AnswerLabel,player3AnswerLabel,player4AnswerLabel,player5AnswerLabel,player6AnswerLabel,player7AnswerLabel,player8AnswerLabel]

        var playerMemberCount = 0
        
    
        
        for _ in 0 ..< GlobalThingsInGame.shared.playerNameArray.count {
            
            print("count2:\(playerMemberCount)")
            print("count:\(count)")

          

            answerPlayerLabelArray[playerMemberCount]?.text = "\(GlobalThingsInGame.shared.playerAnswerAlphabetArray2D[playerMemberCount][count])"

            playerMemberCount += 1

        }
        
        
        
        
        //まずラベルを黒にリセット
        for i in answerPlayerLabelArray {
            i?.textColor = UIColor.black
        }
        
        //出題者ラベルを赤色に
        let questionerPlayerLabel = answerPlayerLabelArray.remove(at: count)
        questionerPlayerLabel?.textColor = UIColor.red
        
        //正解者ラベルを赤色に
        for i in answerPlayerLabelArray {
            if questionerPlayerLabel?.text == i?.text {
                i?.textColor = UIColor.red
            }
        }
        


    }
}
