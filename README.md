# webview-wrapper-ios
An ios webView template that you can drop your html/css/js app into.

You will need to download xCode if you don't already have it: 
https://developer.apple.com/xcode/

1. Build your javascript app.
  - Be sure that your app works when opening index.html directly in a web browser.
2. Drag your built js app folder into the `/nashjs-talk-ios` directory in xCode.
  - If your js build folder is not called `build` change the subdirectory name on line 33 in viewController.swift
3. Build your swift app in xCode (command r)!



Here's a helpful tutorial for building a swift webview app:
https://www.hackingwithswift.com/read/4/2/creating-a-simple-browser-with-wkwebview
