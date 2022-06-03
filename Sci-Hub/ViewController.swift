//
//  ViewController.swift
//  Sci-Hub
//
//  Created by Nima on 3/6/22.
//

import Cocoa
import SafariServices
import WebKit

let extensionBundleIdentifier = "com.nima.single.Sci-Hub.Extension"

class ViewController: NSViewController {
    let defaults = UserDefaults.init(suiteName: "com.nima.sci-hub")

    @IBOutlet var textField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sciHubUrl = defaults?.string(forKey: "sciHubUrl") ?? "https://sci-hub.ee"
        textField.stringValue = sciHubUrl
    }
    
    @IBAction func saveUrl(_ sender: Any) {
        let sciHubUrl = textField.stringValue
        self.defaults?.set(sciHubUrl, forKey: "sciHubUrl")
    }
}
