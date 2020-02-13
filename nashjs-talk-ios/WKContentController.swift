//
//  WKContentController.swift
//  nashjs-talk-ios
//
//  Created by Jessie Wooten on 2/12/20.
//  Copyright © 2020 JessieWooten. All rights reserved.
//

import Foundation
import WebKit

extension ViewController {
//    DEFINES USER SCRIPTS THAT WILL BE EXECUTED AT THE STARTUP OF THE WEBVIEW
    func initContentController(){
        let contentController = self.webView?.configuration.userContentController
//        WE ARE USING WEBKIT MESSAGE HANDLERS TO POST MESSAGES TO OUR DEFINED HANDLERS
        let userScript = WKUserScript(
            source: """
                window.nativeInterface = {
                    setUserDefaultItem: function(a){window.webkit.messageHandlers.setUserDefault.postMessage(a)},
                    getUserDefaultItem: function(a){window.webkit.messageHandlers.getUserDefault.postMessage(a)},
                    removeUserDefaultItem: function(a){window.webkit.messageHandlers.removeUserDefault.postMessage(a)}
                }
            """,
            injectionTime: WKUserScriptInjectionTime.atDocumentStart,
            forMainFrameOnly: true
        )
//        ADD MESSAGE HANDLER NAMES
        contentController!.addUserScript(userScript)
        contentController!.add(self, name: "setUserDefault")
        contentController!.add(self, name: "getUserDefault")
        contentController!.add(self, name: "removeUserDefault")
        
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController!
    }
    
//    FIRES WHEN A MESSAGE HANDLER IS CALLED.
//    LOOKS AT THE MESSAGE NAME TO EXECUTE THE DESIRED CASE
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //SETS A KEY / VALUE PAIR ON USER DEFAULTS
        if(message.name == "setUserDefault") {
            let payload = convertJSONStringToDictionary(JSONString: String(describing: message.body));
            //extract out the values
            let key = String(describing: payload!["key"]!);
            let value = String(describing: payload!["value"]!);
            print("Saving user default: ", key)
            UserDefaults.standard.set(value, forKey: key);
            print("Saved to user defaults!")
        }
        
        // READS A VALUE FROM A KEY ON USER DEFAULTS
        else if(message.name == "getUserDefault") { print("getting user default")
            let payload = convertJSONStringToDictionary(JSONString: String(describing: message.body));
           
            let key = String(describing: payload!["key"]!);
            print("Fetching user default: ", key)
            let value = UserDefaults.standard.string(forKey: key) ?? "null";
            
            sendToJS(view: webView!, type: key, message: value)
        }
        
        //REMOVES A KEY / VALUE PAIR FROM USER DEFAULTS
        else if(message.name == "removeUserDefault") {
            let payload = convertJSONStringToDictionary(JSONString: String(describing: message.body));
            let key = String(describing: payload!["key"]!);
            
            print("Removing user defaults:", key)
            UserDefaults.standard.removeObject(forKey: key);
            print("Deleted from user defaults!")
        }
    }
    
}
