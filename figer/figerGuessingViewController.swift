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
    @IBOutlet var fingerButtons: [UIButton]!
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
        for i in 0...2{
            self.fingerButtons[i].isHidden = false
        }
        
        switch time {
        
        case 1...10:
//                        print(" 『 時間到摟 』")
//            for i in 0...2{
//                self.fingerButtons[i].isHidden = true
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            if imageView[1].image !== nil {
//                    if i != nil {
                self.label.text = " 『 等等 』"
//                    }else{
  
//                        for i in 0...2{
//                            self.fingerButtons[i].isHidden = false
//                        }
//                }
//            }
            }
        case 0:
            fallthrough
        default:
            time = 0
            timer?.invalidate()
            //停止繼續倒數
            timeLabel.text = "時間終了"
            if imageView[1].image !== nil {
                self.label.text = "『 請重新開始 』"
                
            }else{
//                timeLabel.text = "時間到"
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = " 『 遊戲開始 』"
//        replayButton.setTitle("開始遊戲", for: .normal)
        time = 10
        self.backgoundImage.image = UIImage(named: "gameStart")
    }
    
    @IBAction func fingerBtns(_ sender: UIButton) {
        self.imageView[0].isHidden = false
        time = 0
        countDown()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            if sender == self.fingerButtons[0]{
            self.imageView[1].image = UIImage(named: "scissors")
                self.myNumber = 0
                self.label.text = "我出『 剪刀 』!!"
            }else if sender == self.fingerButtons[1]{
                self.imageView[1].image = UIImage(named: "rock")
                self.myNumber = 1
                self.label.text = "我出『 石頭 』!!"
            }else if sender == self.fingerButtons[2]{
                self.imageView[1].image = UIImage(named: "paper")
                self.myNumber = 2
                self.label.text = "我出『 布 』!!"
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7){
        if self.imageView[1].image !== nil{
        
            let pcNumber = Int.random(in: 0...2)
            if self.gameCurrent == .start{
                switch pcNumber {
                case 0: self.imageView[0].image = UIImage(named: "scissors")
//                print("pcCount Image 剪刀")
                case 1: self.imageView[0].image = UIImage(named: "rock")
        //                print("pcCount Image 石頭")
                case 2: self.imageView[0].image = UIImage(named: "paper")
        //                print("pcCount Image 布")
                default: break
            }
                
            if self.myNumber == pcNumber {
                self.label.text = "『 平手。 』"
        //                print("平手")
            }else if (self.myNumber == 1 && pcNumber == 0) || (self.myNumber == 0 && pcNumber == 2) || (self.myNumber == 2 && pcNumber == 1){
                self.label.text = "『 winner！ 』"
                self.backgoundImage.image = UIImage(named: "happy")
        //                print("我贏了！")
            }else if self.imageView[1].image == nil{
                self.label.text = "『 lose！ 』"
                self.backgoundImage.image = UIImage(named: "sad")
        //                print("我輸了！")
            }
            }
        }else{
            self.viewDidLoad()
        }
        
        }
        }
    }
    @IBAction func replayBtn(_ sender: UIButton) {
//        replayButton.setTitle("重新開始", for: .normal)
        imageView[0].image = nil
        imageView[1].image = nil
        backgoundImage.image = UIImage(named: "gameStart")
//        isStart = true
        
        gameCurrent = .start
        label.text = " 『 遊戲開始 』"
//        print("遊戲重新開始")
        
        timer = Timer.scheduledTimer(timeInterval: 1, target:  self,selector: #selector(figerGuessingViewController.countDown), userInfo: nil, repeats: true)
        
        //func scheduledTimer: 用Timer計時（每隔幾秒鐘： 秒數, 做：（self）這個類別裡面的 .countDown（這個func）,沒有下多餘的指令,要重複
        time = 10
        
        if self.imageView[1].isHidden == false {
            self.imageView[0].isHidden = true
            countDown()
            label.text = " 『 遊戲開始 』"
            backgoundImage.image = UIImage(named: "gameStart")
        }else{
            
        }
    }
}
