//
//  EachArtistView.swift
//  Music Browse
//
//  Created by Bishal on 4/9/21.
//this View displays in first page for each of the 10 artist

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
                            .font(.system(size: 30))
                       
                            //.padding(.horizontal,20)
                    }.padding(20)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomTrailing))
                    .cornerRadius(30)
                    //.opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    
            }
        //}
    }
}
