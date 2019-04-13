//
//  App.swift
//  PFA
//
//  Created by Apple on 13/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct App
{
    public var artistId : Int!
    public var artistName : String!
    public var artistViewUrl : String!
    public var artworkUrl100 : String!
    public var artworkUrl30 : URL!
    public var artworkUrl60 : String!
    public var collectionCensoredName : String!
    public var collectionExplicitness : String!
    public var collectionId : Int!
    public var collectionName : String!
    public var collectionPrice : Float!
    public var collectionViewUrl : String!
    public var contentAdvisoryRating : String!
    public var country : String!
    public var currency : String!
    public var discCount : Int!
    public var discNumber : Int!
    public var kind : String!
    public var previewUrl : String!
    public var primaryGenreName : String!
    public var releaseDate : String!
    public var trackCensoredName : String!
    public var trackCount : Int!
    public var trackExplicitness : String!
    public var trackId : Int!
    public var trackName : String!
    public var trackNumber : Int!
    public var trackPrice : Float!
    public var trackTimeMillis : Int!
    public var trackViewUrl : String!
    public var wrapperType : String!
    
    private struct APIKeys {
        static let artistId = "artistId"
        static let artistName =  "artistName"
        static let artistViewUrl = "artistViewUrl"
        static let artworkUrl100 = "artworkUrl100"
        static let artworkUrl30 = "artworkUrl30"
        static let artworkUrl60 = "artworkUrl60"
        static let collectionCensoredName = "collectionCensoredName"
        static let collectionExplicitness = "collectionExplicitness"
        static let collectionId = "collectionId"
        static let collectionName = "collectionName"
        static let collectionPrice = "collectionPrice"
        static let collectionViewUrl = "collectionViewUrl"
        static let contentAdvisoryRating = "contentAdvisoryRating"
        static let country = "country"
        static let currency = "currency"
        static let discCount = "discCount"
        static let discNumber = "discNumber"
        static let kind = "kind"
        static let previewUrl = "previewUrl"
        static let primaryGenreName = "primaryGenreName"
        static let releaseDate = "releaseDate"
        static let trackCensoredName = "trackCensoredName"
        static let trackCount = "trackCount"
        static let trackExplicitness = "trackExplicitness"
        static let trackId = "trackId"
        static let trackName = "trackName"
        static let trackNumber = "trackNumber"
        static let trackPrice = "trackPrice"
        static let trackTimeMillis = "trackTimeMillis"
        static let trackViewUrl = "trackViewUrl"
        static let wrapperType = "wrapperType"
    }
    
    init?(dictionary: [String : Any])
    {
        guard let trackName = dictionary[APIKeys.trackName] as? String,
            let artworkURLString = dictionary[APIKeys.artworkUrl30] as? String,
            let artistName = dictionary[APIKeys.artistName] as? String else {
                return nil
        }
        
        self.artistName = artistName
        self.artworkUrl30 = URL(string: artworkURLString)
        self.trackName = trackName
        
    }
}
