//
//  SafariWebExtensionHandler.swift
//  scihub Extension
//
//  Created by Nima on 19/12/21.
//

import SafariServices
import os.log

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {

	func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as! NSExtensionItem
        let message = item.userInfo?[SFExtensionMessageKey] as? [String:String]
        let request = message?["request"] ?? "none"

        respondToRequest(request, context)

    }
    
    func respondToRequest(_ request: String, _ context: NSExtensionContext) {
        let response = NSExtensionItem()

        switch request {
        case "sci-hub path":
            let defaults = UserDefaults.init(suiteName: "com.nima.sci-hub")
            let sciHubUrl = defaults?.string(forKey: "sciHubUrl") ?? "https://sci-hub.ee"
            response.userInfo = [SFExtensionMessageKey: [
                "url": sciHubUrl
            ]]

        default:
            break
        }
        
        context.completeRequest(returningItems: [response], completionHandler: nil)
    }
}
