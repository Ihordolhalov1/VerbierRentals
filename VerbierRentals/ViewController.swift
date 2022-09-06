//
//  ViewController.swift
//  VerbierRentals
//
//  Created by Ihor Dolhalov on 18.08.2022.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //backButton.isEnabled = true
        //forwardButton.isEnabled = false
        //backButton.isHidden = true
        let url = URL(string: "https://verbierrentals.com")
        webView.navigationDelegate = self
        
        
        let request = URLRequest(url: url!)
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
    }

    @IBAction func backButtonAction(_ sender: UIButton) {
        if webView.canGoBack {
            backButton.isEnabled = true
            
            webView.goBack()
        }
    }
    
    @IBAction func forwardButtonAction(_ sender: UIButton) {
        if webView.canGoForward {
            forwardButton.isEnabled = true
            webView.goForward()
        }
    }
    
}

extension ViewController: WKNavigationDelegate {
    
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       backButton.isEnabled = webView.canGoBack
      forwardButton.isEnabled = webView.canGoForward
   }
    
}

