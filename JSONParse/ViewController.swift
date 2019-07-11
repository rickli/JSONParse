//
//  ViewController.swift
//  JSONParse
//
//  Created by King on 2019/7/10.
//  Copyright © 2019 Rick. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {

    @IBOutlet var inputTextView: NSTextView!
    @IBOutlet var resultTextView: NSTextView!
    @IBOutlet var parseBtn: NSButtonCell!
    
    @objc func MyClassAction(_ sender: AnyObject) -> Void {
        let jsonStr = inputTextView.textStorage?.string
        
        let jsonData = jsonStr?.data(using: .utf8);
        print(jsonData as Any)
        
        if let usableData = jsonData {
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: usableData, options: .allowFragments)  as! [String:AnyObject]
                if jsonArray.count > 0 {
                    print(jsonArray)
                }
                
                if let theJSONData = try?  JSONSerialization.data(
                    withJSONObject: jsonArray,
                    options: .prettyPrinted
                    ),
                    let theJSONText = String(data: theJSONData,
                                             encoding: String.Encoding.utf8) {
                    print("JSON string = \n\(theJSONText)")
                    
                    resultTextView.string = theJSONText;
                }
                
            } catch {
                resultTextView.string = "JSON Processing Failed"
                print("JSON Processing Failed")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseBtn.target = self
        parseBtn.action = #selector(MyClassAction(_:))
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

