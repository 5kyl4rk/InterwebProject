//
//  InterenetMasterViewController.swift
//  InterwebProject
//
//  Created by Fitzgerald, Skyler on 12/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class InternetMasterViewController: UITableViewController
{
    
    private weak var internetDetail : InternetDetailViewController? = nil
    private lazy var internetTopics : [String] = [String]()
    private lazy var addresses : [String] = [String]()
    
    private func setupDetailContents() -> Void
    {
        internetTopics = [
            "Internet Definitions 🦑",
            "Standard Search Engine 🐋",
            "AP CSP 💽",
            "Canyons District ♿️",
            "CTEC 🌊",
            "Social Media 🌚"
        ]
        
        addresses = [
            "https://cprewritten.net/",
            "https://www.tiktok.com/",
            "http://sketchbrook.co.uk/dvdSim.html",
            "https://jcw87.github.io/c2-sans-fight/",
            "http://lucar.io/"
        ]
        
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            internetDetail = currentControllers[0] as? InternetDetailViewController
        }
    }
    
    //This method only happens once with the split view
    override func viewDidLoad()
    {
        super.viewDidLoad()

        setupDetailContents()
        self.clearsSelectionOnViewWillAppear = false

        if let split = splitViewController
        {
            let controllers = split.viewControllers
            internetDetail = (controllers[controllers.count-1] as! UINavigationController).topViewController as? InternetDetailViewController
        }
    }
    
    /**
     this method will execute multiple times aka every time the menu (master0 is displayed
     */
    public override func viewWillAppear(_ animated: Bool) -> Void
    {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        
        super.viewWillAppear(animated)
    }
    // MARK: - Table view data source

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return addresses.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let rowText = internetTopics[indexPath.row]
        cell.textLabel!.text = rowText
        
        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        internetDetail?.detailAddress = addresses[indexPath.row]
        internetDetail?.detailTitle = internetTopics[indexPath.row]
        if(internetDetail != nil)
        {
            splitViewController?.showDetailViewController(internetDetail!, sender: nil
            )
        }
    }

}
