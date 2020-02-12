//
//  HelperFunctions.swift
//  nashjs-talk-ios
//
//  Created by Jessie Wooten on 2/12/20.
//  Copyright © 2020 JessieWooten. All rights reserved.
//

import Foundation
import WebKit;

extension ViewController {
    // EVALUATES JAVASCRIPT STRING IN THE WEBVIEW CONTEXT
        func sendToJS (view: WKWebView, type: String, message: String){
            let jsPayload = "{\"type\": \"\(type)\", \"payload\": \"\(message)\"}";
            let jsResolveFunc = "window.handleIncomingWrapperMessages('\(jsPayload)')"
            
            print("Sending message to JS:", jsPayload)
            view.evaluateJavaScript(jsResolveFunc) { (result, error) in
                if error != nil {
                    print("SEND TO JS ERROR: ", error!)
                }
            }
        }

    //    ACCEPTS STRINGIFIED JSON AND CONVERTS IT TO A DICTIONARY (LIKE AN OBJECT IN SWIFT)
        func convertJSONStringToDictionary(JSONString: String) -> [String: Any]? {
            if let data = JSONString.data(using: .utf8) {
                do {
                    return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                } catch {
                    print("CONVERT TO DICTIONARY ERROR: ",error.localizedDescription)
                }
            }
            return nil
        }
}
