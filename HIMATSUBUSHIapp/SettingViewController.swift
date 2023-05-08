//
//  Haa?2ViewController.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/06/26.
//


import UIKit
import OrderedCollections

//１、プレイヤー数・ラウンド数の決定　２、プレイヤー名を入力する

class SettingViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
    }
    
    
    
    
 
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == memberCountPickerView {
            return member3to8Array.count
        } else {
            return round1to8Array.count
        }
        
    }
    
    
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == memberCountPickerView {
            return String(member3to8Array[row])
        } else {
            return String(round1to8Array[row])
        }
    }
    
    
    
    
    
    //プレイヤー人数によりTextFieldも変動　＋　ラウンド数を格納
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        //pickerViewは複数あるのでどのpickerViewを使っているか、引数で区別
        if pickerView == memberCountPickerView {
            
            //リセット
            checkEmptyTextFieldArray.removeAll()
            
            
            playerTextFieldArray = [player1TextField!,player2TextField!,player3TextField!,player4TextField!,player5TextField!,player6TextField!,player7TextField!,player8TextField!]
            
            
            for i in 0 ..< row + 3 {
                
                checkEmptyTextFieldArray.append(playerTextFieldArray[i])
                
            }
            
 
            player4TextField.isHidden = row <= 0
            player5TextField.isHidden = row <= 1
            player6TextField.isHidden = row <= 2
            player7TextField.isHidden = row <= 3
            player8TextField.isHidden = row <= 4
            
       
            
            //ラウンド数のpickerViewが動かされた時
        } else {
            
            GlobalThingsInGame.shared.roundConut = round1to8Array[row]
        }
            
    }
    
    
    
    
    
    @IBOutlet weak var memberCountPickerView: UIPickerView!
    @IBOutlet weak var roundCountPickerView: UIPickerView!
    
    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    @IBOutlet weak var player3TextField: UITextField!
    @IBOutlet weak var player4TextField: UITextField!
    @IBOutlet weak var player5TextField: UITextField!
    @IBOutlet weak var player6TextField: UITextField!
    @IBOutlet weak var player7TextField: UITextField!
    @IBOutlet weak var player8TextField: UITextField!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    //Picker用の配列
    let member3to8Array = [3,4,5,6,7,8]
    let round1to8Array = [1,2,3,4,5,6,7,8]
    //textが入力されているかを調べる為用の配列
    var checkEmptyTextFieldArray = [UITextField]()
    var playerTextFieldArray =  [UITextField]()
    //pickerviewを動かさなかった場合の初期値
    var memberCount = 3
    

    
    
    //もし、HiddenがtrueになっているTextFieldの中に、何も入力されていないTextFieldが１つでも存在した場合にアラートを出し、画面遷移を行わない。
    @IBAction func next(_ sender: Any) {
        
        
        //未入力textFieldが一つでもあったらアラートを出して画面遷移をさせない
        for i in 0 ..< checkEmptyTextFieldArray.count {
            
            if checkEmptyTextFieldArray[i].text == "" {
                
                let notEntriedAlertController = UIAlertController(title: "入力漏れがあります", message: "確認してみてください", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "戻る", style: .default, handler: nil)
                notEntriedAlertController.addAction(defaultAction)
                present(notEntriedAlertController, animated: true, completion: nil)
                return
            }
            
        }
        
        
        
        
        for i in checkEmptyTextFieldArray {
            
            GlobalThingsInGame.shared.playerNameArray.append(i.text!)
            
            }
   
    
        //HiddenがtrueになっているTextFieldに全て入力されていたら画面遷移
        performSegue(withIdentifier: "next", sender: nil)
        
        
    }

    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        roundLabel.adjustsFontSizeToFitWidth = true
        
        memberCountPickerView.delegate = self
        memberCountPickerView.dataSource = self
        
        roundCountPickerView.delegate = self
        roundCountPickerView.dataSource = self
        
        //初期画面はプレイヤーを３人と設定
        player4TextField.isHidden = true
        player5TextField.isHidden = true
        player6TextField.isHidden = true
        player7TextField.isHidden = true
        player8TextField.isHidden = true
        checkEmptyTextFieldArray += [player1TextField,player2TextField,player3TextField]
        
        
    }
    
  
 
}



