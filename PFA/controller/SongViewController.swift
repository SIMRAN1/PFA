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
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        self.tableView.isHidden = true
        searchTextField.isUserInteractionEnabled = true
        searchTextField.isEnabled = true
        searchTextField.becomeFirstResponder()
        searchTextField.addTarget(self, action: #selector(SongViewController.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        self.tableView.reloadData()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 300.0
        // 1
        view.backgroundColor = .clear
        // 2
       
        // 2
        let vibrancyView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
        // 3
        view.insertSubview(vibrancyView, at: 0)
        NSLayoutConstraint.activate([
            vibrancyView.heightAnchor.constraint(equalTo: view.heightAnchor),
            vibrancyView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            ])
        

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
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.backgroundColor = .clear
        if (apps?.count)!>0 {
        cell.app = apps?[indexPath.row]
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.contentView.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        }  else
        {
            self.tableView.isHidden = true
        }
        
        return cell
    }

}
