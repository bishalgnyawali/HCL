//
//  EachArtistView.swift
//  Music Browse
//
//  Created by Bishal on 4/9/21.
//

import SwiftUI
struct EachArtistView:View{
    
    var artist:String
    //var icon:String
    
    var body:some View{
        //ProgressIndicatorView()
        //ArtistDetailsView(ArtistName:artist)
        
        NavigationLink(
            destination:ArtistDetailsView(ArtistName:artist)){
                //Image("MG")
                    HStack {
                        Text(artist)
                            .foregroundColor(Color.black)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Spacer()
                        Image(systemName: "music.note.list")
                            .foregroundColor(Color.white).padding()
                       
                            //.padding(.horizontal,20)
                    }.padding(20)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomTrailing))
                    .cornerRadius(30)
                    
            }
        //}
    }
}
