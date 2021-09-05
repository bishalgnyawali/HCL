//
//  APIDataModel.swift
//  Music Browse
//
//  Created by Bishal on 2/9/21.
//https://itunes.apple.com/search?term=coldplay&entity=song
//API fetch data model for the app
import Foundation

struct ArtistResponse:Codable{
    let results:[ArtistSong]
}


struct ArtistSong:Codable{
    let trackId:Int
    let collectionName:String
    let trackName:String
    let artworkUrl60:String
    
}
