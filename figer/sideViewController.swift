//
//  sideViewController.swift
//  figer
//
//  Created by 維衣 on 2020/8/22.
//

import UIKit

class fingerGuessing2ViewController: UIViewController {
    
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var sideButtons: [UIButton]!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var replayButton: UIButton!
    
    @IBOutlet var pcHp: [UIImageView]!
    @IBOutlet var myHp: [UIImageView]!
    
    @IBOutlet weak var backgoundImage: UIImageView!
    
    var myRound: Int = 0
    var pcRound: Int = 0
    var myWin:Int = 3
    var pcWin:Int = 3
    var win:Int = 0
    var hpImage:[UIImageView] = []
    
    var howHP:[UIImageView] = []
    
    
    var color:UIColor = UIColor.systemGreen
    var clear:UIColor = UIColor.clear
    
    func resetColor(){
        myRound = 0
        pcRound = 0
        myWin = 3
        pcWin = 3
        win = 0
        hpImage = []
        for i in 0...2{
        myHp[i].backgroundColor = UIColor.systemGreen
        pcHp[i].backgroundColor = UIColor.systemGreen
        }
        backgoundImage.image = UIImage(named: "smile1")
        }
    
    func changePcHp(){
        if pcWin == 3{
            pcHp[0].backgroundColor = UIColor.systemGreen
            pcHp[1].backgroundColor = UIColor.systemGreen
            pcHp[2].backgroundColor = UIColor.systemGreen
//            print("pcHp: 3 HP")
            
        }else if pcWin == 2{
            pcHp[0].backgroundColor = UIColor.systemYellow
            pcHp[1].backgroundColor = UIColor.systemYellow
            pcHp[2].backgroundColor = UIColor.clear
//            print("myHp: 2 HP")
            
        }else if pcWin == 1{
            pcHp[0].backgroundColor = UIColor.systemRed
            pcHp[1].backgroundColor = UIColor.clear
            pcHp[2].backgroundColor = UIColor.clear
//            print("pcHp: 1 HP")
            
        }else if pcWin == 0{
            pcHp[0].backgroundColor = UIColor.clear
            pcHp[1].backgroundColor = UIColor.clear
            pcHp[2].backgroundColor = UIColor.clear
//            print("pcHp: 0 HP")
            
            let alert = UIAlertController(title: "PC已輸的體無完膚。", message: "這局你贏了!!", preferredStyle: .alert)
            let action = UIAlertAction(title: "繼續!", style: .cancel, handler: nil)
                alert.addAction(action)
                present(alert, animated: false, completion: nil)
            
        }
    }
        func changeMyHp(){
            if myWin == 3{
                myHp[0].backgroundColor = UIColor.systemGreen
                myHp[1].backgroundColor = UIColor.systemGreen
                myHp[2].backgroundColor = UIColor.systemGreen
                
//                print("myHp: 3 HP")
            }else if myWin == 2{
                myHp[0].backgroundColor = UIColor.systemYellow
                myHp[1].backgroundColor = UIColor.systemYellow
                myHp[2].backgroundColor = UIColor.clear
                backgoundImage.image = UIImage(named: "smile2")
//                print("myHp: 2 HP")
            }else if myWin == 1{
                myHp[0].backgroundColor = UIColor.systemRed
                myHp[1].backgroundColor = UIColor.clear
                myHp[2].backgroundColor = UIColor.clear
                backgoundImage.image = UIImage(named: "worry")
//                print("myHp: 1 HP")
            }else if myWin == 0{
                myHp[0].backgroundColor = UIColor.clear
                myHp[1].backgroundColor = UIColor.clear
                myHp[2].backgroundColor = UIColor.clear
                backgoundImage.backgroundColor = UIColor.systemGray
//                print("myHp: 0 HP")
                let alert = UIAlertController(title: "你已輸的體無完膚。", message: "這局PC贏了!!", preferredStyle: .alert)
                let action = UIAlertAction(title: "繼續!", style: .cancel, handler: nil)
                    alert.addAction(action)
                    present(alert, animated: false, completion: nil)
            }
        }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = " 『 遊戲開始 』"
        replayButton.setTitle("重新開始", for: .normal)
        myHp[0].backgroundColor = UIColor.systemGreen
        myHp[1].backgroundColor = UIColor.systemGreen
        myHp[2].backgroundColor = UIColor.systemGreen
        pcHp[0].backgroundColor = UIColor.systemGreen
        pcHp[1].backgroundColor = UIColor.systemGreen
        pcHp[2].backgroundColor = UIColor.systemGreen
        backgoundImage.image = UIImage(named: "smile1")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectNumber(_ sender: UIButton) {
        imageViews[0].image = nil
        imageViews[1].image = nil
//        myRound = 0
        
        
        let pcRound = Int.random(in: 0...4)
        switch pcRound {
        case 0: imageViews[0].image = UIImage(named: "one")
//            print("pcRound:Round 1")
        case 1: imageViews[0].image = UIImage(named: "scissors")
//            print("pcRound:Round 2")
        case 2: imageViews[0].image = UIImage(named: "three")
//            print("pcRound:Round 3")
        case 3: imageViews[0].image = UIImage(named: "four")
//            print("pcRound:Round 4")
        case 4: imageViews[0].image = UIImage(named: "paper")
//            print("pcRound:Round 5")
        default: break
        }

        if sender.self == sideButtons[0]{
            imageViews[1].image = UIImage(named: "one")
            myRound = 0
//            print("myRound:Round 1")
        }else if sender.self == sideButtons[1]{
            imageViews[1].image = UIImage(named: "scissors")
            myRound = 1
//            print("myRound:Round 2")
        }else if sender.self == sideButtons[2]{
            imageViews[1].image = UIImage(named: "three")
            myRound = 2
//            print("myRound:Round 3")
        }else if sender.self == sideButtons[3]{
            imageViews[1].image = UIImage(named: "four")
            myRound = 3
//            print("myRound:Round 4")
        }else if sender.self == sideButtons[4]{
            imageViews[1].image = UIImage(named: "paper")
            myRound = 4
//            print("myRound:Round 5")
        }
        
        if myRound == pcRound{
            label.text = "平手"
//            print("平手")
        }else if (myRound == pcRound + 1){
            label.text = "winner"
            pcWin -= 1
//            print("myRound == pcRound + 1")
            changePcHp()
//            print("winner >")
        }else if (myRound == 0 && pcRound == 4){
            label.text = "winner"
            pcWin -= 1
//            print("myRound == 0 && pcRound == 4")
            changePcHp()
//            print("winner 15")
        }else if (myRound == pcRound - 1){
            label.text = "lose"
            myWin -= 1
//            print("myRound == pcRound - 1")
            changeMyHp()
//            print("lose")
        }else if (myRound == 4 && pcRound == 0){
            label.text = "lose"
            myWin -= 1
//            print("myRound == 4 && pcRound == 0")
            changeMyHp()
//            print("lose 51")
        }else{
            label.text = "safe!"
//            print("safe!")
        }
        


    }
    
    @IBAction func replayBtn(_ sender: UIButton) {
        imageViews[0].image = nil
        imageViews[1].image = nil

        label.text = " 『 遊戲開始 』"
        print("遊戲重新開始")
        resetColor()
        
        if imageViews[0].image == nil{
            
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
