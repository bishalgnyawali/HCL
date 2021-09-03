//
//  APIDataModel.swift
//  Music Browse
//
//  Created by Bishal on 2/9/21.
//https://itunes.apple.com/search?term=coldplay&entity=song

import Foundation

struct ArtistResponse:Codable{
    let results:[ArtistSong]
}


struct ArtistSong:Codable{
    let id:Int
    let trackName:String
    let artistName:String
    let artistImageUrl:String
    
}
