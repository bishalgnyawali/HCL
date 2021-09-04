//
//  ContentView.swift
//  Music Browse
//
//  Created by Bishal on 30/8/21.
//

import SwiftUI

//View for each Artist and Navigation link to each artist Songs

                
                
    

//Sub Components that genearate clickable area for each artist
struct ArtistView: View {
    var list=["Miley Cyrus","Britney Spears","Michael Jackson","Jennifer Lopez","Justin Bieber","Spice Girls","Rihana","Bryan Adams","Katy Perry","Madonna"]

    var body: some View {
        
        //Spacer()
       
            
                VStack{
                    
                    ForEach(0..<list.count){
                        //CustomSignUpView(icon:,text:)
                       
                            EachArtistView(artist: list[$0])
                        
                    }
                        
                    
                }//.ignoresSafeArea()
                .opacity(0.8)
           
            
        
    }
    
}



//Main Container
struct ContentView: View {
//    init(){
//            UITableView.appearance().backgroundColor = .red
//
//        }
    var body: some View {
        NavigationView{
            ZStack(alignment:.leading){
                Color.red
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .opacity(0.7)
//                Image("MG")
//                    .resizable()
//                    .edgesIgnoringSafeArea(.all)
//                    .ignoresSafeArea()
                
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
