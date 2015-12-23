//
//  ViewController.swift
//  HandCricket
//
//  Created by R.M.K. Engineering college  on 21/12/15.
//  Copyright (c) 2015 R.M.K. Engineering college . All rights reserved.
//

import UIKit
var batting = false
class ViewController: UIViewController {


    @IBOutlet var toss: UISwitch!
    @IBOutlet var flick: UIButton!
    
    @IBOutlet var bowl: UILabel!
    @IBOutlet var bat: UILabel!
    @IBOutlet var sw2: UISwitch!
    @IBOutlet var input: UITextField!
    @IBOutlet var play: UIButton!
    

    @IBOutlet var output: UILabel!

    func toggle(var x: Bool){
        self.bowl.hidden = x
        self.bat.hidden = x
        self.sw2.hidden = x
        play.hidden = false
        flick.hidden = true

        if !x {
            output.text = "You won the toss!"
            batting = sw2.on
        }
        else{
            if arc4random()%2 == 0 {
                batting = false
                
                
            }
            else {
                batting = true

            }
            output.text = "CPU won the toss"
        }
    }
    @IBAction func FLick(sender: AnyObject) {
        var tossmod:Int!
        tossmod=input.text.toInt()
        var x = tossmod + Int((arc4random()%6)+1)
        if toss.on {
            if x % 2 == 0
            {
                toggle(false)
            }else{
                toggle(true)
            }
        }else{
            if x % 2 != 0
            {
                toggle(false)
            }else{
                toggle(true)
            }
        }
            
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

