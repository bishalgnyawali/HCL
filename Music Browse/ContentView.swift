//
//  ContentView.swift
//  Music Browse
//
//  Created by Bishal on 30/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("MG")
                .resizable()
                .ignoresSafeArea()
            
            HStack {
                Text("Browse Top Ten Music By Artist")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
            }
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
