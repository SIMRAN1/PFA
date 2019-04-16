//
//  MusicTableViewCell.swift
//  PFA
//
//  Created by Apple on 13/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var artworkUrl: UIImageView!
    
    @IBOutlet weak var trackName: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    
    var app: App! {
        didSet {
            self.updateUI()
        }
    }

    func updateUI()
    {
        trackName.text = app.trackName
        artistName.text = app.artistName
        
        
        
        self.artworkUrl.image = nil
        if let url = app.artworkUrl30 {
            let request = URLRequest(url: url)
            let networkProcessor = NetworkProcessor(request: request)
            
            networkProcessor.downloadData(completion: { (data, response, error) in
                DispatchQueue.main.async {
                    if let imageData = data {
                        self.artworkUrl.image = UIImage(data: imageData)
                        self.artworkUrl.layer.cornerRadius = 5.0
                        self.artworkUrl.layer.masksToBounds = true
                    }
                }
            })
        }
    }

}
