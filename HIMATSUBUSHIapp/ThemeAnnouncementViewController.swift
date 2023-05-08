//
//  themeAnnouncementViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/07/17.
//



import UIKit

//お題を１つランダムに取得し表示
class ThemeAnnouncementViewController: UIViewController {
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        
        //お題を全て格納しシャッフル、そこから１つのお題セットを取得
        GlobalThingsInGame.shared.allThemeSetArray = [theme1,theme2,theme3,theme4,theme5,theme6,theme7,theme8,theme9]
        GlobalThingsInGame.shared.allThemeSetArray.shuffle()
        GlobalThingsInGame.shared.oneSetRandomTheme = GlobalThingsInGame.shared.allThemeSetArray.remove(at: 0)

                
        
    }
    

    var orderCount = -1
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        themeLabel.adjustsFontSizeToFitWidth = true
        
        
        roundCountLabel.text = "\(GlobalThingsInGame.shared.appendRoundCount)回戦"
        
        orderCount += 1
        playerSceneCheckButton.setTitle("\(GlobalThingsInGame.shared.playerNameArray[orderCount])さんのシーンを確認する", for: .normal)
        
 
        //labelに反映
        themeLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme?.theme
        subThemeLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme?.subTheme
        sceneALabel.text = GlobalThingsInGame.shared.oneSetRandomTheme?.a
        sceneBLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme?.b
        sceneCLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme?.c
        sceneDLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme?.d
        sceneELabel.text = GlobalThingsInGame.shared.oneSetRandomTheme?.e
        sceneFLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme?.f
        sceneGLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme?.g
        sceneHLabel.text = GlobalThingsInGame.shared.oneSetRandomTheme?.h
        

    }
    
    
    @IBOutlet weak var roundCountLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var subThemeLabel: UILabel!
    @IBOutlet weak var sceneALabel: UILabel!
    @IBOutlet weak var sceneBLabel: UILabel!
    @IBOutlet weak var sceneCLabel: UILabel!
    @IBOutlet weak var sceneDLabel: UILabel!
    @IBOutlet weak var sceneELabel: UILabel!
    @IBOutlet weak var sceneFLabel: UILabel!
    @IBOutlet weak var sceneGLabel: UILabel!
    @IBOutlet weak var sceneHLabel: UILabel!
    @IBOutlet weak var playerSceneCheckButton: UIButton!
    
    


  
    

    
    
    let theme1 = Theme(theme: "はぁ", subTheme: "", a: "A：なんで？の「はぁ」", b: "B：力をためる「はぁ」", c: "C：ぼうぜんの「はぁ」", d: "D：感心の「はぁ」", e: "E：怒りの「はぁ」", f: "F：とぼけの「はぁ」", g: "G：おどろきの「はぁ」", h: "H：失恋の「はぁ」")
    
    let theme2 = Theme(theme: "鼻を使って", subTheme: "表情のみ", a: "A：臭いぞ、の鼻", b: "B：いい香り〜、の鼻", c: "C：くしゃみが出る直前の鼻", d: "D：ガス漏れ？の鼻", e: "E：ふんがー！の鼻", f: "F：泣いているときの鼻", g: "G：自慢げな鼻", h: "H：ムズムズしているときの鼻")
    
    let theme3 = Theme(theme: "振り向いて", subTheme: "振り向きと表情のみ", a: "A：友達に声をかけられて", b: "B：後ろで事件が起きて", c: "C：財布を落として", d: "D：靴をふまれて", e: "E：ゆうれいの気配を感じて", f: "F：不気味に", g: "G：ぶりっこ風に", h: "H：モデル風に")
    
    let theme4 = Theme(theme: "はい", subTheme: "", a: "A：ノックされたときの「はい」", b: "B：聞き返すときの「はい」", c: "C：出欠確認のときの「はい」", d: "D：やる気のない「はい」", e: "E：プレゼントをわたすときの「はい」", f: "F：怒られているときの「はい」", g: "G：驚いたときの「はい」", h: "H：告白OKのときの「はい」")
    
    let theme5 = Theme(theme: "にゃー", subTheme: "", a: "A：捨て猫の「にゃー」", b: "B：猫に向かっての「にゃー」", c: "C：あまえた「にゃー」", d: "D：リアル猫の「にゃー」", e: "E：混乱したときの「にゃー」", f: "F：威嚇の「にゃー」」", g: "G：ねむいときの「にゃー」", h: "H：かわいい「にゃー」")
    
    let theme6 = Theme(theme: "うん", subTheme: "", a: "A：素直に「うん」", b: "B：ふんばって「うん」", c: "C：おかしいな、の「うん」", d: "D：はずかしがって「うん」", e: "E：興味のない「うん」", f: "F：元気いっぱいに「うん」", g: "G：悩んで「うん」", h: "H：とまどって「うん」")
    
    let theme7 = Theme(theme: "なんで", subTheme: "", a: "A：手品におどろいて「なんで」", b: "B：不機嫌に「なんで」", c: "C：自分を責めて「なんで」", d: "D：ありえない！の「なんで」", e: "E：パニックになって「なんで」", f: "F：わがままの「なんで」", g: "G：フラれたときの「なんで」", h: "H：カレー屋の注文の「ナンで」")
    
    let theme8 = Theme(theme: "スモモもモモもモモのうち", subTheme: "早口言葉", a: "A：猛スピードを目指して", b: "B：正確さを目指して", c: "C：かっこよく", d: "D：失敗しても平然と", e: "E：冷静に", f: "F：アクセントをまちがえて", g: "G：セクシーに", h: "H：「モ」を１回だけ多く")
    
    let theme9 = Theme(theme: "自己紹介", subTheme:  "【　】に自分の名前", a: "A：ヒーロー風に「【名前】です」", b: "B：セクシーに「【名前】です」", c: "C：悪役っぽく「【名前】です」", d: "D：天才っぽく「【名前】です」", e: "E：クールに「【名前】です」", f: "F：怪力男で「【名前】です」", g: "G：超美形で「【名前】です」", h: "H：ふつうに「【名前】です」")


    
    
    
    
    @IBAction func goToSceanCheckButton(_ sender: UIButton) {
 
        performSegue(withIdentifier: "sceneCheck", sender: nil)
        
    }
    
    
    

}

