//
//  ViewController.swift
//  wckiev-api3-swift
//
//  Created by Som Sam on 03.05.16.
//  Copyright © 2016 Serge Moskalenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).viewController = self
        
        let button: UIButton = UIButton()
        button.frame = CGRectMake(0, 0, 200, 30)
        button.setTitle("Get WCKIEV info", forState: .Normal)
        button.backgroundColor = UIColor.blueColor()
        button.titleLabel?.textColor = UIColor.whiteColor()
        button.center = view.center
        button.addTarget(self, action: #selector(ViewController.getInfo), forControlEvents: .TouchUpInside)
        button.tag = 777
        view.addSubview(button)
        
        
    }

    func getInfo() {
        let myselfUrlString: String = "wckievapi3://run/#".stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let url: NSURL = NSURL(string: "wckiev://list/#location=50.45,30.57&zoom=13&comfort=0&sender=\(myselfUrlString)")!
        if UIApplication.sharedApplication().canOpenURL(url) {
            UIApplication.sharedApplication().openURL(url)
        }
        else {
            UIApplication.sharedApplication().openURL(NSURL(string: "http://itunes.apple.com/ru/app/wc-kiev/id516140318?mt=8")!)
        }
    }
    
    func getItemInfo(button: UIButton) {
        let itemId: Int = button.tag
        //    NSURL* url = [NSURL URLWithString:@"wckiev://run/#location=50.45,30.57&zoom=13&comfort=0"];
        let myselfUrlString: String = "wckievapi3://run/#".stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let url: NSURL = NSURL(string: "wckiev://detail/#item=\(itemId)&sender=\(myselfUrlString)")!
        UIApplication.sharedApplication().openURL(url)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

