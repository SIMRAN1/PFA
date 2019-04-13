//
//  SongViewController.swift
//  PFA
//
//  Created by Apple on 12/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


class SongViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var apps: [App]?
    var appStoreClient = AppStoreClient()
  //  let tableFrame: CGRect = CGRectMake(0, 0, chosenWidth, CGFloat(numOfRows) * rowHeight)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchApps()
        self.tableView.reloadData()
        
        self.tableView.estimatedRowHeight = tableView.rowHeight
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
   
    
    func fetchApps()
    {
        print("1")
        appStoreClient.fetchApps(withTerm: "link", inEntity: "musicVideo") { (apps) in
            self.apps = apps
            print(self.apps)
            self.tableView.reloadData()
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
    }

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell", for: indexPath) as! MusicTableViewCell
        
        cell.app = apps?[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }

}
