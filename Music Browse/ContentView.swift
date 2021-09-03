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
            ProgressView("Loading")
                .scaleEffect(1.5, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
        }
        
    }
}


//new page when api load gets successful
struct ArtistDetailsView:View{
    @State var results=[ArtistSong]()
    @State private var progress:Bool=false
    var ArtistName:String
    //var title:String
    var body:some View{
        NavigationView{
            if(progress==true){
                List(results,id:\.trackId){ item in
                    VStack(alignment:.leading){
                        Text(item.trackName)
                    }
                }.onAppear(perform:ApiCall)
                //Text(ArtistName)
            }else{
                //title=ArtistName
                ProgressIndicatorView().onAppear(perform:ApiCall)
            }
        }.navigationTitle(ArtistName)
    }
    
    func ApiCall(){
        let newString = ArtistName.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        guard let url=URL(string: "https://itunes.apple.com/search?term="+newString+"&entity=song&limit=10")
        else{
            print("Invalid URL")
            return
        }
        
        let request=URLRequest(url: url)
        
        URLSession.shared.dataTask(with:request){ data,response,error in
            
            if let data=data{
                //print("true")
                if let decodedResponse=try?JSONDecoder().decode(ArtistResponse.self,from:data){
                    DispatchQueue.main.async{
                        self.results=decodedResponse.results
                    }
                    progress=true
                    return
                }
                
            }
            print("Fetch Failed:")
            
        }.resume()
    }
    //print(results)
}




//View for each Artist and Navigation link to each artist Songs
struct EachArtistView:View{
    
    var artist:String
    var icon:String
    
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
                            Image(systemName: icon)
                                .foregroundColor(Color.white).padding()
                            
                                 
                       
                            //.padding(.horizontal,20)
                            
                    }.padding(20)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: .bottomTrailing))
                    .cornerRadius(50)
            }
        }
}
                
                
    

//Sub Components that genearate clickable area for each artist
struct ArtistView: View {
    var list=["Miley Cyrus","Britney Spears","Michael Jackson","Jennifer Lopez","Justin Bieber","Selena Gomez","Rihana","Bryan Adams","Katy Perry","Madonna"]
    var icon=["mail","mail","mail","mail","mail","mail","mail","mail","mail","mail"]
    var body: some View {
        //Spacer()
       
            
                VStack{
                    
                    ForEach(0..<list.count){
                        //CustomSignUpView(icon:,text:)
                       
                            EachArtistView(artist: list[$0], icon:icon[$0])
                        
                    }
                        
                    
                }.ignoresSafeArea()
                .opacity(0.8)
           
            
        
    }
    
}



//Main Container
struct ContentView: View {
    //@State var results=[ArtistSong]()
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
                        .border(Color.black)
                        .font(.system(size: 30, weight: .heavy, design: .default))
                        
                    //Spacer()
                    VStack{
                        ScrollView{
                            
                            ArtistView()
                            
                        }
                    }
                    //Spacer()
                }.padding(.horizontal,20)
                
                
                
            }.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .leading, endPoint: .bottomTrailing))
            .ignoresSafeArea()
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
