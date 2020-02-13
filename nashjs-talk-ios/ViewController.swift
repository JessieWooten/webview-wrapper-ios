//
//  ViewController.swift
//  nashjs-talk-ios
//
//  Created by Jessie Wooten on 2/11/20.
//  Copyright © 2020 JessieWooten. All rights reserved.
//

import UIKit
// STEP 1: IMPORT WEBKIT
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {
    
    // STEP 2: DEFINE A WEBVIEW VARIABLE
    var webView:WKWebView?
    
    // loadview() is not included in your ViewController.swift file when you create a new project. We have to add this.
    override func loadView() {
        super.loadView()
         //STEP 3: INITIALIZE A WEBVIEW
        let webConfiguration = WKWebViewConfiguration();
        webView = WKWebView(frame: .zero, configuration: webConfiguration);
        view = webView
        webView?.scrollView.bounces = false;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // INITIALIZE OUR SCRIPT TO RECEIVE JS MESSAGES FROM THE WEBVIEW. (THIS FUNCTION DEFINITION IS IN WKContentController.swift)
        initContentController()
        
        // STEP 4A: CREATE A FILE PATH URL TO THE INDEX.HTML FILE
        let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "build")
        // OR STEP 4B: CREATE A WEB URL TO THE INDEX.HTML FILE
//        let url = URL(string: "https://google.com")
        
        // STEP 5: CONVERT THE URL TO A URLREQUEST
        let urlReq = URLRequest(url: url!);
        // STEP 6: LOAD THE URLREQUEST IN THE WEBVIEW
        webView?.load(urlReq)
        
    }

}

