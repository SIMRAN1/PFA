//
//  SongViewController.swift
//  PFA
//
//  Created by Apple on 12/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


class SongViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var apps: [App]?
    var appStoreClient = AppStoreClient()
  //  let tableFrame: CGRect = CGRectMake(0, 0, chosenWidth, CGFloat(numOfRows) * rowHeight)
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isHidden = true
        searchTextField.isUserInteractionEnabled = true
        searchTextField.isEnabled = true
        searchTextField.becomeFirstResponder()
        searchTextField.addTarget(self, action: #selector(SongViewController.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        self.tableView.reloadData()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 300.0
    }
    
    @objc
    func textFieldDidChange(textField : UITextField){
        let count = searchTextField.text?.count
        if count!>3 {
            self.tableView.isHidden = false
            appStoreClient.fetchApps(withTerm: searchTextField.text!, inEntity: "musicVideo") { (apps) in
                self.apps = apps
                print(self.apps)
                self.tableView.reloadData()
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.rowHeight = UITableView.automaticDimension
                self.tableView.estimatedRowHeight = 300.0
            }
        } else {
            self.tableView.isHidden = true
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell", for: indexPath) as! MusicTableViewCell
        if (apps?.count)!>0 {
        cell.app = apps?[indexPath.row]
        cell.selectionStyle = .none
        }  else
        {
            self.tableView.isHidden = true
        }
        
        return cell
    }

}
