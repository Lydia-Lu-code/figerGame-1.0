//
//  figerGuessingViewController.swift
//  figer
//
//  Created by 維衣 on 2020/8/22.
//

import UIKit
//import GameplayKit


class figerGuessingViewController: UIViewController {
    
    @IBOutlet var imageView: [UIImageView]!
    @IBOutlet weak var label: UILabel!
    @IBOutlet var figerButtons: [UIButton]!
    @IBOutlet weak var replayButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var backgoundImage: UIImageView!
    
    enum CompareWithPc:String {
        case start,round,end
    }

    var gameCurrent = CompareWithPc.start
    var myNumber: Int = 0
    var pcNumber:Int = 0
    var time = 10
    var timer: Timer?
    
    @objc func countDown(){
        time -= 1
        timeLabel.text = "倒數\(time)秒"
        
        if time < 0{
            time = 0
            timeLabel.text = "時間終了"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = " 『 遊戲開始 』"
        time = 10
        backgoundImage.image = UIImage(named: "gameStart")
        gameCurrent = .start
        
        for i in 0...2 {
            figerButtons[i].isHidden = false
        }

        timer = Timer.scheduledTimer(timeInterval: 1, target:  self,selector: #selector(figerGuessingViewController.countDown), userInfo: nil, repeats: true)
    }
    
    @IBAction func figerBtns(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            if sender == self.figerButtons[0]{
            self.imageView[1].image = UIImage(named: "scissors")
                self.myNumber = 0
                self.label.text = "我出『 剪刀 』!!"
            }else if sender == self.figerButtons[1]{
                self.imageView[1].image = UIImage(named: "rock")
                self.myNumber = 1
                self.label.text = "我出『 石頭 』!!"
            }else if sender == self.figerButtons[2]{
                self.imageView[1].image = UIImage(named: "paper")
                self.myNumber = 2
                self.label.text = "我出『 布 』!!"
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.time = 10
        if self.imageView[1].image !== nil{
            self.timer?.invalidate()
//            //停止繼續倒數
            let pcNumber = Int.random(in: 0...2)
            if self.gameCurrent == .start{
                switch pcNumber {
                case 0: self.imageView[0].image = UIImage(named: "scissors")
                case 1: self.imageView[0].image = UIImage(named: "rock")
                case 2: self.imageView[0].image = UIImage(named: "paper")
                default: break
            }
            
            if self.myNumber == pcNumber {
                self.label.text = "『 平手。 』"
                self.backgoundImage.image = UIImage(named: "gameStart")
            }else if (self.myNumber == 1 && pcNumber == 0) || (self.myNumber == 0 && pcNumber == 2) || (self.myNumber == 2 && pcNumber == 1){
                self.label.text = "『 win！ 』"
                self.backgoundImage.image = UIImage(named: "happy")
            }else if (self.myNumber == 0 && pcNumber == 1) || (self.myNumber == 2 && pcNumber == 0) || (self.myNumber == 1 && pcNumber == 2){
                self.label.text = "『 lose！ 』"
                self.backgoundImage.image = UIImage(named: "sad")
                }
            }
        }else if self.imageView[1].image == nil{
            self.imageView[0].image = nil
            self.time = 0
            self.countDown()
            self.timeLabel.text = "時間終了"
                }
            }
        }
    }
    @IBAction func replayBtn(_ sender: UIButton) {
        imageView[0].image = nil
        imageView[1].image = nil
        viewDidLoad()
    }
}
