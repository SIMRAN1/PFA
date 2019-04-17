//
//  SongViewController.swift
//  PFA
//
//  Created by Apple on 12/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit



class SongViewController: UIViewController,UITableViewDelegate{
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let reachability = Reachability()
    
     let alert = UIAlertController(title: "Warning", message: "Please Connect to Internet", preferredStyle: .alert)
    
    let dataSource = SongDataSource()
    
    lazy var viewModel : SongViewModel = {
        let viewModel = SongViewModel(dataSource: dataSource)
        return viewModel
    }()
    
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
        checkReachability()
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
                self.viewModel.fetchSongs(term: searchTextField.text!)
                print(self.apps)
                self.tableView.reloadData()
                self.tableView.delegate = self
                self.tableView.dataSource = self.dataSource
                self.tableView.tableFooterView = UIView()
                self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
                self?.tableView.reloadData()
            }
                self.tableView.rowHeight = UITableView.automaticDimension
                self.tableView.estimatedRowHeight = 300.0
            
        } else {
            self.tableView.isHidden = true
        }
    }
    
    func checkReachability() {
        
        if Reachability.isConnectedToNetwork(){
            self.setUIBasedOnReachability(value: true)
        }else{
            self.setUIBasedOnReachability(value: false)
        }
        
    }
    
    func setUIBasedOnReachability(value: Bool) {
        DispatchQueue.main.async {
            self.searchTextField.isEnabled = value
            if value {
                self.alert.dismiss(animated: true, completion: nil)
            } else {
                self.present(self.alert, animated: true, completion: nil)
            }
        }
    }
   

}
