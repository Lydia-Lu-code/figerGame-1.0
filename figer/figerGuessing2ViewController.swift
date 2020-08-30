//
//  sideViewController.swift
//  figer
//
//  Created by 維衣 on 2020/8/22.
//

import UIKit

class figerGuessing2ViewController: UIViewController {
    
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var figerButtons: [UIButton]!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var replayButton: UIButton!
    @IBOutlet var pcHp: [UIImageView]!
    @IBOutlet var myHp: [UIImageView]!
    @IBOutlet weak var backgoundImage: UIImageView!
    
    var myRound: Int = 0
    var pcRound: Int = 0
    var myCount: Int = 3
    var pcCount: Int = 3
    var whoCount: Int = 0
    var whoHP:[UIImageView] = []
    var color:UIColor = UIColor.systemGreen
    var clear:UIColor = UIColor.clear
    var index:Int = 0
    var imageName0:String = ""
    var imageName1:String = ""
    var title1:String = ""
    var messages:String = ""
    
    func changeHp(){
        if whoHP == pcHp{
            whoCount = pcCount - 1
            pcCount = whoCount
        }else if whoHP == myHp{
            whoCount = myCount - 1
            myCount = whoCount
        }
        
            switch whoCount {
            case 2: color = UIColor.systemYellow; index = 2
                if whoHP == myHp{
                    backgoundImage.image = UIImage(named: "smile2")
                }
            case 1: color = UIColor.systemRed; index = 1
                if whoHP == myHp{
                    backgoundImage.image = UIImage(named: "worry")
                }
            case 0:
                fallthrough
            default:
                index = 0
                if pcCount == 0{
                    //如果這邊設『title』，也會一併顯示在最上面的title上
                    title1 = "PC已輸的體無完膚。"
                    messages = "這局你贏了!!"
                }else if myCount == 0{
                    title1 = "你已輸的體無完膚。"
                    messages = "這局PC贏了!!"
                    backgoundImage.image = UIImage(named: "sad")
                }
            }
                
            for i in 0...whoCount{
                whoHP[i].backgroundColor = color
                }
            
            for x in index...2{
                whoHP[x].backgroundColor = nil
                
                if index == 0{
                    let alert = UIAlertController(title: title1, message: messages, preferredStyle: .actionSheet)
                    let action = UIAlertAction(title: "繼續!", style: .cancel) { (_) in
                        self.viewDidLoad()
                    }
                        alert.addAction(action)
                        present(alert, animated: false, completion: nil)
                    }
                }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myRound = 0
        pcRound = 0
        myCount = 3
        pcCount = 3
        whoCount = 0
        imageViews[0].image = nil
        imageViews[1].image = nil
        label.text = " 『 遊戲開始 』"
        
        for i in 0...2{
            myHp[i].backgroundColor = UIColor.systemGreen
            pcHp[i].backgroundColor = UIColor.systemGreen
        }
        backgoundImage.image = UIImage(named: "smile1")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func figerBtn(_ sender: UIButton) {

        switch sender{
            case figerButtons[0]: imageName1 = "one"; myRound = 1
            case figerButtons[1]: imageName1 = "scissors"; myRound = 2
            case figerButtons[2]: imageName1 = "three"; myRound = 3
            case figerButtons[3]: imageName1 = "four"; myRound = 4
            case figerButtons[4]: imageName1 = "paper"; myRound = 5
            default: break
            }
        imageViews[1].image = UIImage(named: "\(imageName1)")
        
        let pcRound = Int.random(in: 1...5)
        switch pcRound{
            case 1: imageName0 = "one"
            case 2: imageName0 = "scissors"
            case 3: imageName0 = "three"
            case 4: imageName0 = "four"
            case 5: imageName0 = "paper"
            default: break
            }
        imageViews[0].image = UIImage(named: "\(imageName0)")

        if (myRound == pcRound + 1){
            label.text = "winner"
            whoHP = pcHp
            changeHp()
        }else if (myRound == 1 && pcRound == 5){
            label.text = "winner"
            whoHP = pcHp
            changeHp()
        }else if (myRound == pcRound - 1){
            label.text = "lose"
            whoHP = myHp
            changeHp()
        }else if (myRound == 5 && pcRound == 1){
            label.text = "lose"
            whoHP = myHp
            changeHp()
        }else{
            label.text = "safe"
            }
        }
    
    @IBAction func replayBtn(_ sender: UIButton) {
        viewDidLoad()
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
