//
//  ContentView.swift
//  Music Browse
//
//  Created by Bishal on 30/8/21.
//

import SwiftUI

struct ArtistView: View {
    var list=["Miley Cyrus","Britney Spears","Michael Jackson","Jennifer Lopez","Justin Bieber","Spice Girls","Rihana","Bryan Adams","Katy Perry","Madonna"]

    var body: some View {
                VStack{
                    ForEach(0..<list.count){
                            EachArtistView(artist: list[$0])
                    }
                }
                .opacity(0.8)
    }
}



//Main Container
struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack(alignment:.leading){
                Color.orange
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .opacity(0.5)
                
                VStack(alignment:.leading) {
                    ZStack{
                        //Image("mn")
                        Text("Songs")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .padding()
                            .navigationTitle("Select Artist for their")
                        //Spacer()
                    }
                    ScrollView{
                        
                            ArtistView()
                    }
                    //Spacer()
                }.padding(.horizontal,20)
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
