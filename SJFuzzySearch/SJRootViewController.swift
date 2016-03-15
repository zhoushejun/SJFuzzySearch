//
//  SJRootViewController.swift
//  SJFuzzySearch
//
//  Created by shejun.zhou on 15/6/12.
//  Copyright (c) 2015年 shejun.zhou. All rights reserved.
//

import UIKit

class SJRootViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var labTip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.labTip.text = "您选择的城市为："

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

    @IBAction func fuzzySearchButtonAction(sender: UIButton) {
        var storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        var viewController:SJViewController = storyboard.instantiateViewControllerWithIdentifier("SJViewController") as! SJViewController
        viewController.titleWithClosuer = {
            (title:String) in
            self.labTip.text = "您选择的城市为：" + title
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
