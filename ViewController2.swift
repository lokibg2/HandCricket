//
//  ViewController2.swift
//  HandCricket
//
//  Created by R.M.K. Engineering college  on 23/12/15.
//  Copyright (c) 2015 R.M.K. Engineering college . All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var pS = 0
    var cS = 0
    
    @IBOutlet var one: UIButton!
    
    @IBOutlet var status: UILabel!
    @IBOutlet var two: UIButton!
  
    @IBOutlet var again: UIButton!
    @IBOutlet var pSL: UILabel!
    @IBOutlet var three: UIButton!
    @IBOutlet var four: UIButton!
    @IBOutlet var five: UIButton!
    @IBOutlet var six: UIButton!
    @IBOutlet var cSL: UILabel!
    var flag = false
    
    @IBOutlet var result: UILabel!
    
    func end(){
        result.hidden = false
        if(pS > cS){
            result.text = "Congo! You win!!! :) "
        }else if(pS < cS){
            result.text = "You lost! Tough Luck! :( "
        }else{
            result.text = "Match Drawn!! You're Even!"
        }
        again.hidden = false
        one.enabled = false
        two.enabled = false
        three.enabled = false
        four.enabled = false
        five.enabled = false
        six.enabled = false
        
    }
    
    func action(sender: UIButton){
        if let x = sender.titleLabel!.text{
            var run = x.toInt()!
            var cr = Int(arc4random_uniform(6) + 1)
            if batting {
                if(cr == run){
                    batting = false
                    
                    if flag{
                        end()
                        status.text = "You are Out!! Game Over!!!"
                    }
                    else{
                        flag = !flag
                        status.text = "You are Out!! CPU's turn to bat"
                    }
                }else{
                    if(flag){
                        if pS > cS{
                            end()
                            pS -= run
                        }
                    }
                    pS += run
                }
   
            }else{
                if(cr == run){
                    batting = true
                    if flag{
                        end()
                        status.text = "CPU is Out!! Game Over!!! \(batting)"
                    }
                    else{
                        flag = !flag
                        status.text = "CPU is Out!! Your turn to bat!!! \(batting)"
                    }
                }else{
                    if(flag){
                        if cS > pS{
                            end()
                            cS -= cr
                        }
                    }
                    cS += cr
                }
            }
            pSL.text = String(pS)
            cSL.text = String(cS)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        one.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        two.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        three.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        four.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        five.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        six.addTarget(self, action: "action:", forControlEvents: .TouchUpInside)
        again.hidden = true
        one.enabled = true
        two.enabled = true
        three.enabled = true
        four.enabled = true
        five.enabled = true
        six.enabled = true
        print(batting)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
