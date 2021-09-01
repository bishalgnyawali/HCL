//
//  ContentView.swift
//  Music Browse
//
//  Created by Bishal on 30/8/21.
//

import SwiftUI
//Indicator page blocking user interaction when api data is being loaded

struct ProgressIndicatorView:View{
    var body:some View{
        ZStack{
            //Image("MG")
            ProgressView().font(.largeTitle)
        }
        
    }
}
//new page when api load gets successful
struct ArtistDetailsView:View{
    var body:some View{
        Text("Hello Artist")
    }
}

struct EachArtistView:View{
    var artist:String
    var icon:String
    var body:some View{
        
        NavigationLink(
            destination:ProgressIndicatorView()){
                //Image("MG")
                    HStack {
//                        ZStack{
                            
                            Image(systemName: icon)
                                .foregroundColor(Color.black).padding()
                            Spacer()
                            Text(artist)
                                 
                        //}
                            //.padding(.horizontal,20)
                            
                    }.padding(20)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomTrailing))
                    .cornerRadius(50)
            }
        }
}
                
                
    


struct ArtistView: View {
    var list=["Miley Cyrus","Britney Spears","Michael Jackson","Jennifer Lopez","Justin Bieber","Selena Gomez","Rihana","Beyonce","Katy Perry","Madonna"]
    var icon=["mail","mail","mail","mail","mail","mail","mail","mail","mail","mail"]
    var body: some View {
        //Spacer()
       
            
                VStack{
                    
                    ForEach(0..<list.count){
                        //CustomSignUpView(icon:,text:)
                       
                            EachArtistView(artist: list[$0], icon:icon[$0])
                        
                    }
                        
                    
                }.ignoresSafeArea()
           
            
        
    }
    
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("MG")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Text("My Favorite Composer")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(Color.blue)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 30, weight: .heavy, design: .default))
                    //Spacer()
                    VStack{
                        ScrollView{
                            
                            ArtistView()
                            
                        }
                    }
                    //Spacer()
                }.padding(.horizontal,20)
                
                
            }
            
            //.ignoresSafeArea()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomTrailing))
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
