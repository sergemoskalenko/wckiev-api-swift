//
//  ViewController.swift
//  wckiev-api-swift
//
//  Created by Serge Moskalenko on 02.05.16.
//  Skype:camopu-ympo
//  mob: +380677629137
//  Copyright © 2016 Serge Moskalenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button: UIButton = UIButton()
        button.frame = CGRectMake(0, 0, 200, 30)
        button.setTitle("Run WCKIEV App", forState: .Normal)
        button.backgroundColor = UIColor.blueColor()
        button.titleLabel?.textColor = UIColor.whiteColor()
        button.center = self.view.center
        button.addTarget(self, action: #selector(ViewController.runWcKievApp), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func runWcKievApp() {
        let url: NSURL = NSURL(string: String(format: "wckiev://run/#location=50.45,30.57&zoom=12&comfort=0"))!
        if UIApplication.sharedApplication().canOpenURL(url) {
            UIApplication.sharedApplication().openURL(url)
        }
        else { // https://itunes.apple.com/ru/app/wc-kiev/id516140318?mt=8
            let url: NSURL = NSURL(string: "itms-apps://itunes.apple.com/ru/app/wc-kiev/id516140318?mt=8")!
            if UIApplication.sharedApplication().canOpenURL(url) {
                UIApplication.sharedApplication().openURL(url)
            }
            else
            {
                let url: NSURL = NSURL(string: "https://itunes.apple.com/ru/app/wc-kiev/id516140318?mt=8")!
                if UIApplication.sharedApplication().canOpenURL(url) {
                    UIApplication.sharedApplication().openURL(url)
                }
            }
        }
    }

}

