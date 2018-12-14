//
//  InternetDetailViewController.swift
//  InterwebProject
//
//  Created by Fitzgerald, Skyler on 12/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit
import WebKit

public class InternetDetailViewController: UIViewController
{

    @IBOutlet weak var webViewer: WKWebView!
    @IBOutlet weak var screenTitle: UILabel!
    
    var detailTitle : String?
    {
        didSet
        {
            updateView()
        }
    }
    
    var detailAddress : String?
    {
        didSet
        {
            updateView()
        }
    }
    
    private func updateView() -> Void
    {
        if(detailTitle != nil && screenTitle != nil && webViewer != nil) //all three have to exist
        {
            if(detailTitle?.range(of: "Definitions", options: .caseInsensitive) != nil)
            {
                loadPDF()
            }
            else
            {
                if(detailAddress != nil)
                {
                    loadURL(webAddress: detailAddress!)
                }
            }
            screenTitle?.text = detailTitle
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        // Do any additional setup after loading the view.
    }
    
    private func loadURL(webAddress: String) -> Void
    {
        
    }
    
    private func loadPDF() -> Void
    {
        
    }

}
