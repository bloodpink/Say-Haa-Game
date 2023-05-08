//
//  Global.swift
//  HIMATSUBUSHIapp
//
//  Created by 小川汰賀 on 2022/09/14.
//

import Foundation
import OrderedCollections
import UIKit

class GlobalThingsInGame {

    
    static let shared = GlobalThingsInGame()
    //空含めた全プレイヤー名情報
    var playerNameArray = [String]()
    //全お題集
    var allThemeSetArray = [Theme]()
    //１ラウンド毎のお題
    var oneSetRandomTheme : Theme!
    //ラウンド数（pickerViewに触られなければ以下の数字が使われる）
    var roundConut = 1
    //ラウンド数を記録するカウント
    var appendRoundCount = 0
    //xibファイルのセルをまとめる
    var xibCellAnswerArray = [UITableViewCell]()
    //１戦毎の各プレイヤーのシーンを、プレイヤーの演技順に格納するための配列
    var oneSetOrderActSceneArray = [String]()
    //各プレイヤーのポイント
    var pointArray = [Int]()
    //各プレイヤーの名前とポイント
    var playerPointNameAndArray2D = [[PlayerNameAndPoint]]()
    //各場所で使う
    var count = 0
    //各プレイヤーの正解と解答のアルファベット
    var playerAnswerAlphabetArray2D = [[String]]()
    

}
