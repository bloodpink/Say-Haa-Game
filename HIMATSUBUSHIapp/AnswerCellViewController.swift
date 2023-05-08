//
//  AnswerAnswerViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2023/05/02.
//

import UIKit

class AnswerCellViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    
    //セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    
    //
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let marginView = UIView()
        marginView.backgroundColor = .clear
        
        return marginView
    }
    
    
    
    //セクションのヘッダーの高さ
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0
        }else {
            return 30
        }
    }

    //セクションのフッターの高さ
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .red
    }
    
    
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = .blue
    }
    
    
    
    
    var cellForRowAtCount = 0
    var tappedCellText = ""
    
    
    //セル構築
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell {
            let themeArray = [GlobalThingsInGame.shared.oneSetRandomTheme.a,GlobalThingsInGame.shared.oneSetRandomTheme.b,GlobalThingsInGame.shared.oneSetRandomTheme.c,GlobalThingsInGame.shared.oneSetRandomTheme.d,GlobalThingsInGame.shared.oneSetRandomTheme.e,GlobalThingsInGame.shared.oneSetRandomTheme.f,GlobalThingsInGame.shared.oneSetRandomTheme.g,GlobalThingsInGame.shared.oneSetRandomTheme.h]
            
            cell.sceneCellTextLabel.text = "\(themeArray[cellForRowAtCount])"
            tableView.rowHeight = 50
            cell.layer.cornerRadius = 8
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.masksToBounds = false
            cell.cellImage.image = UIImage(named: "unchecked")
            
            //スクロールする度にセル構築メソッドが呼ばれる為、cellForRowAtCountが増えてしまうので、cellForRowAtCountが7を超えないようにするをつける
            if cellForRowAtCount < 7 {
                cellForRowAtCount += 1
            } else {
                cellForRowAtCount = 0
            }
            

            
            GlobalThingsInGame.shared.xibCellAnswerArray.append(cell)
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    
    
    
    var tappedCell = TableViewCell()
    var firstString = Substring()
    
    
    //セルがタップされた時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //タップした時のセルを白にする
        tableView.deselectRow(at: indexPath as IndexPath, animated: false)
  
        
        
        
        
        
        
        //UIImage変更
        for i in GlobalThingsInGame.shared.xibCellAnswerArray {
            
            let cell = i as! TableViewCell
            
            if cell.isChecked == true {
                
                cell.isChecked = false
        
            } else {
                cell.isChecked = true
                
            }
            
        }
        
        
        
        
        let table = tableView.cellForRow(at: indexPath)
        
        tappedCell = table as! TableViewCell
        
        //全てのcellをfalseにする（UIImageのため）
        for i in GlobalThingsInGame.shared.xibCellAnswerArray {
            
            var cell = i as! TableViewCell
            cell.isChecked = false
            
        }
        //選択したセルだけtrueにする（UIImageのため）
        tappedCell.isChecked = true
       

        tappedCellText = tappedCell.sceneCellTextLabel.text!
        
        //解答のアルファベットを取得
        firstString = tappedCellText.prefix(1)


    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
 
    


    
    //下２つの変数は統合のために配列にしている
    var quetionerNameAndPointArray  = [PlayerNameAndPoint]()
    var quetionerAnswerAlphabetArray = [String]()
    

    
    //出題者の名前＆ポイント、回答者の名前＆ポイントに分ける
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        
        
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        self.tableView.backgroundColor = UIColor.clear

        //出題者ポイント（removeされたものは一時的に出題者ポイント配列になる）
        quetionerNameAndPointArray  = GlobalThingsInGame.shared.playerPointNameAndArray2D.remove(at: GlobalThingsInGame.shared.count)
        //出題者解答（removeされたものは一時的に出題者解答配列になる）
        quetionerAnswerAlphabetArray = GlobalThingsInGame.shared.playerAnswerAlphabetArray2D.remove(at: GlobalThingsInGame.shared.count)

        questionTextLabelChange()
        
        
    }
    
    
    
    
    
    
    
    
    //回答毎に＋１するカウント
    var clickAppendCount = 0
    
    
    //　①セルがタップされていなければアラートを出す①プレイヤーが選んだセルのindexを格納　　②プレイヤーが選んだセル（回答）のアルファベットを格納　　③正解なら回答者と出題者ポイントに＋１
    @IBAction func answerButton(_ sender: Any) {
        
        
        //①セルがタップされていなければアラートを出す
    testif:if tappedCellText == "" {
            
            let alertController = UIAlertController(title: "回答が選択されていません", message: "回答を１つ選択してください", preferredStyle: .alert)
            present(alertController, animated: true, completion: nil)
            let alertAction = UIAlertAction(title: "戻る", style: .default, handler: nil)
            alertController.addAction(alertAction)
            return;
        
        break testif
            
        }
        

        
        //②プレイヤーが選んだセル（回答）のアルファベットを格納
        GlobalThingsInGame.shared.playerAnswerAlphabetArray2D[clickAppendCount].append(String(firstString))
        
        
        //③正解なら回答者と出題者に＋１
        if GlobalThingsInGame.shared.oneSetOrderActSceneArray[GlobalThingsInGame.shared.count] == tappedCellText {
            
            quetionerNameAndPointArray [0].point += 1
            GlobalThingsInGame.shared.playerPointNameAndArray2D[clickAppendCount][0].point += 1
            
        }
       
        print("GlobalThingsInGame.shared.playerPointNameAndArray2D:\(GlobalThingsInGame.shared.playerPointNameAndArray2D)")
    
        clickAppendCount += 1
        
        tappedCell.isChecked = false
        


        
    


        
        //1人の出題者に対して全員の回答者が解答終了時
    testif:if clickAppendCount == GlobalThingsInGame.shared.playerPointNameAndArray2D.count {
        
        
     
        
       
        
        
        
           //cellArray.appende(cell)はviewController画面に遷移した時に毎回行われる。その為１出題者につき全員の回答が終了したらまたcellがappendされることを見越して、格納されている８つcellを削除する必要がある。そうしないと１６こ、２４こというセルが格納され,falseCountで正しい計算ができなくなる（ちなみに１回答ごとに全てfalseにしている）
        
        GlobalThingsInGame.shared.xibCellAnswerArray.removeAll()
           
        //出題者ポイントと正解を戻す
        GlobalThingsInGame.shared.playerPointNameAndArray2D.insert(quetionerNameAndPointArray , at: GlobalThingsInGame.shared.count)
        GlobalThingsInGame.shared.playerAnswerAlphabetArray2D.insert(quetionerAnswerAlphabetArray, at: GlobalThingsInGame.shared.count)
        
        
        

           
           

           //順番が最後のプレイヤーが回答者配列に含まれていなかったら（つまり、全員出題者側が終了したら）
           if  quetionerNameAndPointArray[0].name == GlobalThingsInGame.shared.playerNameArray.last {
               
               GlobalThingsInGame.shared.count = 0
               
               performSegue(withIdentifier: "answer", sender: nil)
               //処理を抜ける（抜けないと下のpopViewControllerも呼ばれてしまう）
               break testif
           }
        
        GlobalThingsInGame.shared.count += 1
        self.navigationController?.popViewController(animated: true)
        
        }
        
        
        
        //画面遷移する前に以下を書くとIndexオーバーになるので画面遷移コードより下に書く
        questionTextLabelChange()
    }
    
    
    
    
    
    
    
    
    func questionTextLabelChange () {
        //ここでもglobalPlayerArrayの中身は回答者だけになっている
        label.text = "\(GlobalThingsInGame.shared.playerPointNameAndArray2D[clickAppendCount][0].name)さんが思う\(quetionerNameAndPointArray [0].name)さんの演技はどれ？"
    }
    
    
}


