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
        // INITIALIZE OUR SCRIPT TO RECEIVE JS MESSAGES FROM THE WEBVIEW
        initContentController()
        
        // STEP 4: CREATE A URL PATH (FILE OR WEB URL) TO THE INDEX.HTML FILE
        let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "build")
        // STEP 5: CONVERT THE URL TO A URLREQUEST
        let urlReq = URLRequest(url: url!);
        // STEP 6: LOAD THE URLREQUEST IN THE WEBVIEW
        webView?.load(urlReq)
        
    }

}

