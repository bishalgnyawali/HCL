//
//  ArtistDetailsView.swift
//  Music Browse
//
//  Created by Bishal on 4/9/21.
//

import SwiftUI

struct ArtistDetailsView:View{
    @State var results=[ArtistSong]()
    @State private var progress:Bool=false
    //@State private var scroll:Bool=false
    //@State private var title:String=""
    var ArtistName:String
    //var title:String
    var body:some View{
        NavigationView{
            if(progress==true){
                List(results,id:\.trackId){ item in
                    
                    VStack(alignment:.leading){
                            Text("Album: "+item.collectionName)
                                .padding()
                                .frame(maxWidth:.infinity,alignment:.leading)
                                .font(.title)
                                //.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .bottomTrailing))
                            Text("Song Title: "+item.trackName)
                                .padding()
                                .frame(maxWidth:.infinity,alignment:.leading)
                                .font(.title)
                                //.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .bottomTrailing))
                                    
                                    
                                }
                                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .bottomTrailing))
                                .cornerRadius(30)
                    
                            
                    
                }//.background(Color.red)
                .onAppear(perform:ApiCall)
                //.background(Color.red)
                .navigationBarTitleDisplayMode(.inline)
                        .toolbar { // <2>
                            ToolbarItem(placement: .principal) { // <3>
                                VStack(alignment:.leading) {
                                    Text(ArtistName)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        
                                        //.padding(.bottom)
                                    Spacer()
                                }//.background(Color.blue)
                                .frame(maxWidth:.infinity)
                                
                                //.padding(.horizontal)
                            }
                }
                //Text(ArtistName)
            }else{
                //title=ArtistName
                ProgressIndicatorView().onAppear(perform:ApiCall)
            }
        }.navigationTitle("Top 10 Song's by")
        //.background(Color.blue)
    }
    
    func ApiCall(){
        let newString = ArtistName.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        guard let url=URL(string: "https://itunes.apple.com/search?term="+newString+"&entity=song&limit=10")
        else{
            print("Invalid URL")
            return
        }
        //progress=false
        let request=URLRequest(url: url)
        
        URLSession.shared.dataTask(with:request){ data,response,error in
            
            if let data=data{
                //print("true")
                if let decodedResponse=try?JSONDecoder().decode(ArtistResponse.self,from:data){
                    DispatchQueue.main.async{
                        self.results=decodedResponse.results
                    }
                    progress=true
                    //title="Top 10 Song's by"
                    return
                }
                
            }
            print("Fetch Failed:")
            
        }.resume()
    }
    //print(results)
}
