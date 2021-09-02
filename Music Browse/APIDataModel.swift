//
//  APIDataModel.swift
//  Music Browse
//
//  Created by Bishal on 2/9/21.
//

import Foundation

struct ArtistResponse:Decodable{
    
}


struct ArtistSong:Decodable{
    let id:Int
    let trackName:String
    let artistName:String
    let artistImageUrl:String
    
}
