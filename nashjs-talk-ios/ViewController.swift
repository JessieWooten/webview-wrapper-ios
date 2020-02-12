//
//  ViewController.swift
//  nashjs-talk-ios
//
//  Created by Jessie Wooten on 2/11/20.
//  Copyright © 2020 JessieWooten. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {
    
    var webView:WKWebView?
    
    override func loadView() {
        super.loadView()
         //STEP 1: INITIALIZE A WEBVIEW
        let webConfiguration = WKWebViewConfiguration();
        webView = WKWebView(frame: .zero, configuration: webConfiguration);
        view = webView
        webView?.scrollView.bounces = false;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initContentController()
        
        // STEP 2: CREATE A FILE URL TO THE INDEX.HTML FILE
        let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "build")
        // STEP 3: CONVERT THE URL TO A URLREQUEST
        let urlReq = URLRequest(url: url!);
        // STEP 4: LOAD THE URLREQUEST IN THE WEBVIEW
        webView?.load(urlReq)
        
    }

}

